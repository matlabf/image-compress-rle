function rleSave(filename, img)
  file = fopen(filename, 'w');
  yres = size(img, 1);
  xres = size(img, 2);
  pixels = yres * xres;
  fwrite(file, yres, 'uint16');
  fwrite(file, xres, 'uint16');

  ptr = 1;
  count = 0;
  val = img(1, 1);
  imgRow = reshape(img, 1, pixels);
  data = uint8(zeros(1, 2*pixels));
  for i = 1 : pixels
    if(imgRow(1,i) == val)
      count = count + 1;
    else
      data(1,ptr) = uint8(val);
      data(1,ptr+1) = uint8(count);
      ptr = ptr + 2;
      val = imgRow(1,i);
      count = 1;
    end
  end
  data(1,ptr) = uint8(val);
  data(1,ptr+1) = uint8(count);
  data = data(1,1:(ptr+1));
  fwrite(file, data, 'uint8');
  fclose(file);
end
