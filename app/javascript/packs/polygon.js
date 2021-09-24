document.addEventListener(
    'turbolinks:load', () => {
        let ctx = document.getElementById('polygon').getContext('2d');
        let cordinates = document.getElementById('dataset').dataset.cordinates
        ctx.fillStyle = '#f00';
        ctx.beginPath();
        ctx.moveTo(0, 0);
        JSON.parse(cordinates).forEach((data)=> {
            return ctx.lineTo(parseInt(data[0]), parseInt(data[1]));
        })
        ctx.closePath();
        ctx.fill();
    }
);