# Lisa Eisner Jewelry

This is the source code for lisaeisnerjewelry.com.

## Asset processing

To process assets in batch, use `mogrify` (the ImageMagick CLI utility).
For example, to resize all JPEG images in a folder to a max width of 2000px:

```
mogrify -resize '2000' *.jpg
```

In the future this could be built into an image-processing rake task if needed.
ImageOptim is also being used in the build process, so there is no need to do
that manually.
