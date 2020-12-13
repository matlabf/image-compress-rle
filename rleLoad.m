function img = rleLoad(filename)
  file = fopen(filename, 'r');
  yres = fread(file, 1, 'uint16');
  xres = fread(file, 1, 'uint16');
  pixels = yres * xres;

  ptr = 1;
  imgRow = uint8(zeros(1, pixels));
  data = fread(file, [1 inf], 'uint8');
  for i = 1 : 2 : length(data)
    val = data(1,i);
    count = data(1,i+1);
    imgRow(1,ptr:(ptr+count-1)) = val * ones(1,count);
    ptr = ptr + count;
  end
  img = reshape(imgRow, yres, xres);
  fclose(file);
end
