#!/system/bin/sh

# to run adb shell sh < android_debloater.sh


for pkg in \
    com.google.android.apps.mediahome.launcher \
    com.google.android.videos \
    com.google.android.apps.tachyon \
    com.google.android.apps.tv \
    com.google.android.apps.photos \
    com.google.android.apps.magazines \
    com.google.android.apps.googleassistant \
    com.google.android.apps.walletnfcrel \
    com.google.android.apps.docs \
    com.google.android.music \
    com.google.android.youtube \
    com.google.android.apps.youtube.music \
    com.android.chrome \
    com.google.android.apps.bard \
    com.google.android.feedback \
    com.lenovo.ue.device \
    com.tblenovo.lenovowhatsnew \

do
  echo "Uninstalling $pkg..."
  pm uninstall -k --user 0 "$pkg"
done
