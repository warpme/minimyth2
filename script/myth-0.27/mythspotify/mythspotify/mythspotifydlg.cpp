// qt
#include <QVector>
// mythtv
#include <mythuitext.h>
#include <mythuibutton.h>
#include <mythlogging.h>
#include <mythdialogbox.h>
// mythspotify
#include "mythspotifydlg.h"


MythSpotifyDlg::MythSpotifyDlg(MythScreenStack* parent, QString name, QString text)
                    : MythScreenType(parent, name) {
    this->text = text;
}

MythSpotifyDlg::~MythSpotifyDlg() {
    
}

bool MythSpotifyDlg::Create() {
    if (!LoadWindowFromXML("mythspotify-ui.xml", "popupdlg", this))
        return false;

    MythUIText* txttext = NULL;
    MythUIButton* btnok = NULL;

    bool error = false;
    UIUtilE::Assign(this, txttext, "txttext", &error);
    UIUtilW::Assign(this, btnok, "btnok", &error); 

    if (error) {
        LOG(VB_GENERAL, LOG_ERR, "Cannot load screen 'popupdlg'");
        return false;
    }

    txttext->SetText(text);

    if (btnok)
        connect(btnok, SIGNAL(Clicked()), SLOT(Close()));

    BuildFocusList();

    return true;
}


MythSpotifyBusyDlg::MythSpotifyBusyDlg(const QString& message, MythScreenStack* parent, const char* name, int timeout, bool exit) 
                    : MythUIBusyDialog(message, parent, name) {
    
    m_parent = parent;
    m_timer = new QTimer(this);
    m_exit = exit;
    connect(m_timer, SIGNAL(timeout()), this, SLOT(slt_timeout()));
    m_timer->start(timeout);
}

MythSpotifyBusyDlg::~MythSpotifyBusyDlg() {
    if(m_timer != NULL)
        m_timer->stop();
    delete m_timer;
}

void MythSpotifyBusyDlg::slt_timeout() {
    m_timer->stop();
    QString message = tr("Timeout");
    
    MythConfirmationDialog* confirmdlg = new MythConfirmationDialog(m_parent, message, false);

    if (confirmdlg->Create())
        m_parent->AddScreen(confirmdlg);

    connect(confirmdlg, SIGNAL(haveResult(bool)), this, SLOT(slt_close(bool)));
    emit sig_timeout();
}

void MythSpotifyBusyDlg::slt_close(bool result) {

    Close();
    if(m_exit) {
        QVector<MythScreenType*> screenlist;
        m_parent->GetScreenList(screenlist);
        MythScreenType* screen = screenlist.first();
        screen->Close();
    }
}

