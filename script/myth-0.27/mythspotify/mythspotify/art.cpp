// c
#include <stdlib.h>
// qt
#include <QFile>
#include <QDataStream>
#include <QIODevice>
#include <QDir>
#include <QImage>
// mythtv
#include <mythcorecontext.h>
// mythspotify
#include "art.h"


map<QString, Art*> Art::m_imagemap;

Art::Art(QString id, ImageFormat format, const byte* data, size_t size) {
    m_id = QString(id);
    m_format = format;
    m_data = new byte[size];
    memcpy(m_data, data, size);
    m_size = size;
    QString extension;

    switch(m_format) {
        case IMAGE_FORMAT_JPEG:
            extension = QString(".jpg");
            break;
        case IMAGE_FORMAT_UNKNOWN:
            extension = QString(".unknown");
            break;
    }

    QString cache = gCoreContext->GetSetting("MythSpotifyCache");
    m_directory = QString(cache);
    
    m_filename = QString(m_id).append(extension);

    WriteToFile();
    delete m_data;
    m_data = NULL;
}

Art::~Art() {
    QFile::remove(GetFilename());    
}

Art* Art::Create(QString id, ImageFormat format, const byte* data, size_t size) {
    map<QString, Art*>::iterator it = m_imagemap.find(id);
    if(m_imagemap.end() != it) {
        return it->second;
    } else {
        Art* art = new Art(id, format, data, size);
        m_imagemap[id] = art;
        return art;
    }
}

void Art::Remove(QString id) {
    map<QString, Art*>::iterator it = m_imagemap.find(id);
    if(m_imagemap.end() != it) {
        delete it->second;
        m_imagemap.erase(it);
    }
}

void Art::Clear() {
    for(map<QString, Art*>::iterator it = m_imagemap.begin(); it != m_imagemap.end(); it++) {
        delete it->second;
    }
    m_imagemap.clear();
}

Art* Art::GetArt(QString id) {
    map<QString, Art*>::iterator it = m_imagemap.find(id);
    if(m_imagemap.end() != it)
        return it->second;
    else 
        return NULL;
}

bool Art::HasArt(QString id) {
    map<QString, Art*>::iterator it = m_imagemap.find(id);
    if(m_imagemap.end() != it)
        return true;
    else 
        return false;
}

ImageFormat Art::GetFormat() {
    return m_format;
}

const byte* Art::GetData() {
    return m_data;
}

size_t Art::GetSize() {
    return m_size;
}

QString Art::GetID() {
    return m_id;
}

void Art::WriteToFile() {
    QImage image = QImage::fromData(m_data, m_size, 0);
    image.save(GetFilename(), 0, 100);
}

QString Art::GetFilename() {
    return QString(m_directory).append(QDir::separator()).append(m_filename); 
}
