# Custom Image Example - Penpot
In this example we will be building a Penpot image forked from one of our existing Nginx + Node.js images.

What Are Custom Images?
Our Cloud Container product is built on top of a technology called Docker that utilises containers to run websites or applications in. These containers each use an 'image' that the container runs, for example your first container may use the Apache + PHP 8.2 image and your next may use the Nginx + PHP 7.4 image.

We provide a few images out of the box, but if you need something we don't provide, that's where custom images come in. They allow you to build an image to your exact specifications and then run containers on your server using that image.

So, What Can I Create?
Good question. We have tried to make this product as flexible as possible and hope that you'll be able to build whatever you may need. We already have people using custom images to run Ruby on Rails, unique PHP modules and completely custom web server stacks. It's really up to you.

That's not to say there aren't any limitations, you may find some, but if you do we'll do our best to help you through them.

The Process
Create a custom image by forking from one of our exisitng images. In this example we forked from the `Nginx + Node.js 20` image.
Replace your Dockerfile from this example repository.
Copy the default-data/config/ from this example repository into the same location (default-data/config/) in your custom image repository. This directory will contain the Penpot config files that you can adjust to your needs.
Commit the changes.
Viewing Build Status and Build Log.
Support
To learn more about custom images, please see our knowledge base:

Cloud Container - https://kb.sitehost.nz/cloud-containers
Custom Images - https://kb.sitehost.nz/cloud-containers/custom-images
