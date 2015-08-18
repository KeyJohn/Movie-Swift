//!function(){
self.onload = function(){
    var img_template = '<img src="#{img_src}" /><em class="em"></em>',
        img_nodes = document.body.getElementsByTagName('img'),
        imgs = [],
        srcs = [];
	for(var i=0,l=img_nodes.length;i<l;++i){
		imgs.push(img_nodes.item(i));
	}
	
	var imgcheck = function(){
		if(this.width > 200){
			var src = this.src,
                new_img_node = document.createElement('div');
            srcs.push(src);
			this.parentNode.replaceChild(new_img_node,this);
			new_img_node.innerHTML = img_template.replace(/#{img_src}/g,src);
            new_img_node.className = 'img_boxs';
            new_img_node.addEventListener('click', function(){
                location.href = 'click:' + src + ';' + srcs.join(';');
            }, false);
		}
	}

	
	for(var i=0,l=imgs.length,img;i<l;++i){
		img = imgs[i];
		img.onload = imgcheck;
		var src = img.src;
		img.src = '';
		img.src = src;
	}
	var video_template = '<a rel="#{video_src}" onclick="self.location=\'click2:\'+this.rel"></a>';
    
	var video_nodes = document.body.getElementsByTagName('video');
	var videos = [];
	for(var i=0,l=video_nodes.length;i<l;++i){
		videos.push(video_nodes.item(i));
		video_nodes[i].pause();
	}
	
	for(var i=0,l=videos.length;i<l;++i){
		var src = videos[i].src;
		var new_video_node = document.createElement('div');
		videos[i].parentNode.replaceChild(new_video_node,videos[i]);
		new_video_node.innerHTML = video_template.replace(/#{video_src}/g,src);
        new_video_node.className = 'video_boxs';
	}
};