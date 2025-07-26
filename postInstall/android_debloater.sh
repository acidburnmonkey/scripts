#!/system/bin/sh

# to run paste on terminal:
# adb shell sh < android_debloater.sh


for pkg in \
    com.android.chrome \
    com.block.juggle \
    com.dreamgames.royalmatch \
    com.facebook.appmanager \
    com.facebook.katana \
    com.facebook.system \
    com.google.android.apps.bard \
    com.google.android.apps.docs \
    com.google.android.apps.googleassistant \
    com.google.android.apps.magazines \
    com.google.android.apps.mediahome.launcher \
    com.google.android.apps.photos \
    com.google.android.apps.tachyon \
    com.google.android.apps.tv \
    com.google.android.apps.walletnfcrel \
    com.google.android.apps.youtube.music \
    com.google.android.feedback \
    com.google.android.health.connect.backuprestore \
    com.google.android.healthconnect.controller \
    com.google.android.music \
    com.google.android.overlay.modules.healthfitness.forframework \
    com.google.android.videos \
    com.google.android.youtube \
    com.google.mainline.telemetry \
    com.king.candycrushsaga \
    com.lenovo.ue.device \
    com.microsoft.appmanager \
    com.microsoft.office.officehubrow \
    com.microsoft.office.outlook \
    com.microsoft.skydrive \
    com.particlenews.newsbreak \
    com.samsung.android.app.clipboardedge \
    com.samsung.android.app.notes \
    com.samsung.android.app.omcagent \
    com.samsung.android.app.routines \
    com.samsung.android.app.smartcapture \
    com.samsung.android.app.soundpicker \
    com.samsung.android.app.spage \
    com.samsung.android.app.taskedge \
    com.samsung.android.app.watchmanager \
    com.samsung.android.bixby.agent \
    com.samsung.android.bixby.ondevice.enus \
    com.samsung.android.bixby.ondevice.esus \
    com.samsung.android.bixby.vision.framework \
    com.samsung.android.bixby.wakeup \
    com.samsung.android.game.gamehome \
    com.samsung.android.game.gametools \
    com.samsung.android.game.gos \
    com.samsung.android.mobileservice \
    com.samsung.android.smartcallprovider \
    com.samsung.android.smartface \
    com.samsung.android.smartface.overlay \
    com.samsung.android.smartmirroring \
    com.samsung.android.smartsuggestions \
    com.samsung.android.smartswitchassistant \
    com.samsung.android.spay \
    com.samsung.android.themestore \
    com.samsung.android.tvplus \
    com.samsung.gamedriver.sm8750 \
    com.samsung.sree \
    com.samsung.android.oneconnect \
    com.samsung.android.voc \
    com.sec.android.app.shealth \
    com.sec.android.smartfpsadjuster \
    com.sec.mhs.smarttethering \
    com.sec.penup \
    com.spotify.music \
    com.tblenovo.lenovowhatsnew \
    com.tripledot.solitaire \
    com.tripledot.woodoku \
    com.vitastudio.mahjong \
    com.yelp.android


do
  echo "Uninstalling $pkg..."
  pm uninstall -k --user 0 "$pkg"
done
