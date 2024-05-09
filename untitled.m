img = niftiread("/Users/rudyzhang/Desktop/Subject_1.nii.gz");

vents = img;
vents(vents ~= 4 & vents ~= 43) = 0;
vents = vents(:,:,157:256);

fh = [];

for i = 1:256
    left = zeros(100,1);
    right = zeros(100,1);
    v_slice = imrotate(reshape(vents(:,i,:),[256,100]),90);
    if any(v_slice,'all')
        for j = 1:256
            left(logical(v_slice(:,j).*~left)) = j;
            right(logical(v_slice(:,257-j).*~right)) = 257-j;
        end
        res = right - left+1;
        fh = [fh;[i,max(res)]];
    end
    imshow(v_slice)
    i
    %pause(0.05)
    hold on
end
[fh_width,f] = max(fh(:,2))
f = fh(f,1);
whole_b = imrotate(reshape(img(:,f,:),[256,256]),90);
subplot(1,2,1)
imshow(imrotate(reshape(vents(:,f,:),[256,100]),90))
subplot(1,2,2)
imshow(whole_b)

left = zeros(256,1);
right = zeros(256,1);
for j = 1:256
    left(logical(whole_b(:,j).*~left)) = j;
    right(logical(whole_b(:,257-j).*~right)) = 257-j;
end
res = right - left+1;
b_width = max(res)
evans_ratio = fh_width / b_width
