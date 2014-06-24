#ifndef ART_H
#define	ART_H
// c++
#include <map>
// qt
#include <QString>
// mythspotify
#include "imageformat.h"



typedef unsigned char byte;

using std::map;

class Art {
    public:
        virtual ~Art();
        static void Clear();
        static void Remove(QString id);
        static Art* Create(QString id, ImageFormat format, const byte* data, size_t size);
        static Art* GetArt(QString id);
        static bool HasArt(QString id);
        ImageFormat GetFormat();
        QString GetFilename();
        size_t GetSize();
        const byte* GetData();
        QString GetID();
    protected:
        Art(QString id, ImageFormat format, const byte* data, size_t size);
        void WriteToFile();
        static map<QString, Art*> m_imagemap;
    private:
        QString m_id;
        ImageFormat m_format;
        byte* m_data;
        size_t m_size;
        QString m_directory;
        QString m_filename;

};

#endif

