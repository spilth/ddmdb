require 'spec_helper'

describe MiniatureHelper do
  describe '#miniature_thumbnail' do
    context 'single digit number and release_id' do
      it 'generates a thumbnail url' do
        miniature = double(:minature, number: 1, release_id: 1)
        expect(miniature_thumbnail(miniature)).to eq "http://ddmdb-images.spilth.org.s3-website-us-east-1.amazonaws.com/images/thumbs/0101_thmb.jpg"
      end
    end

    context 'double digit number and release_id' do
      it 'generates a thumbnail url' do
        miniature = double(:minature, number: 42, release_id: 42)
        expect(miniature_thumbnail(miniature)).to eq "http://ddmdb-images.spilth.org.s3-website-us-east-1.amazonaws.com/images/thumbs/4242_thmb.jpg"
      end
    end
  end

  describe '#miniature_image' do
    context 'single digit number and release_id' do
      it 'generates an image url' do
        miniature = double(:minature, number: 1, release_id: 1)
        expect(miniature_image(miniature)).to eq "http://ddmdb-images.spilth.org.s3-website-us-east-1.amazonaws.com/images/miniatures/0101.jpg"
      end
    end

    context 'double digit number and release_id' do
      it 'generates an image url' do
        miniature = double(:minature, number: 42, release_id: 42)
        expect(miniature_image(miniature)).to eq "http://ddmdb-images.spilth.org.s3-website-us-east-1.amazonaws.com/images/miniatures/4242.jpg"
      end
    end
  end
end
