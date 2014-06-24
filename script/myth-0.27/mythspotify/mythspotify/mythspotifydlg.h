#ifndef MYTHSPOTIFYDLG_H
#define MYTHSPOTIFYDLG_H

// qt
#include <QObject>
#include <QTimer>
// mythtv
#include <mythscreentype.h>
#include <mythprogressdialog.h>

class MythSpotifyDlg : public MythScreenType {
    Q_OBJECT
    public:
        MythSpotifyDlg(MythScreenStack* parent, QString name, QString text);
        ~MythSpotifyDlg();
        bool Create();
    private:
        QString text;

};

class MythSpotifyBusyDlg : public MythUIBusyDialog {
    Q_OBJECT
    public:
        MythSpotifyBusyDlg(const QString& message, MythScreenStack* parent, const char* name, int timeout, bool exit);
        ~MythSpotifyBusyDlg();
    signals:
        void sig_timeout();
    private slots:
        void slt_close(bool result);
        void slt_timeout();
    private:
        bool m_exit;
        QTimer* m_timer;
        MythScreenStack* m_parent;
};

#endif
