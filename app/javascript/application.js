// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "chartkick"
import "Chart.bundle"

document.addEventListener('turbo:load', () => {
    // adentify active link
    const currentLocation = location.href;
    const navLink = document.querySelectorAll('.nav-link');

    navLink.forEach((link) => {
        if(link.href === (currentLocation)){
            link.classList.add('active')
        } else {
            link.classList.remove('active')
        }
    });
});