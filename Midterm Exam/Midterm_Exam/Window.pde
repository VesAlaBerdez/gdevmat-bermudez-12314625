// Class to set window properties
public static class Window 
{
  public static int widthPx = 1920;
  public static int heightPx = 1080;
  public static int windowWidth = widthPx;
  public static int windowHeight = heightPx;
  public static int top = windowHeight / 2;
  public static int bottom = -windowHeight /2;
  public static int left = -windowWidth /2;
  public static int right = windowWidth /2;
  public static float eyeZ = -(heightPx / 2.0) / tan(PI * 30.0 / 180.0);
}
