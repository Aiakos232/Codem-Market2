$(function() {
    window.addEventListener('message', function(event) {
        var item = event.data;
        var state = false;
        if (event.data.type == "data") {
            $(".anasayfa").css('display', "block");
            var i;
            console.log('acildi');
            for (i = 0; i < event.data.item.length; i++) {

                $('.container').append(
                    ` <div class='card' data-id="1" id = ${event.data.item[i].price} itemcode =${event.data.item[i].itemscode} label =${event.data.item[i].name} >
                <div class='card-content'>
                    <div class="itemscode">${event.data.item[i].itemscode}</div>
                
                    <div class='top-bar'><span>${event.data.item[i].price} $</span><span class='float-right lnr lnr-heart'></span></div>
                    <div class='img' ><img  src="${event.data.item[i].image}"></div> 
                </div>
                <div class='card-description'>
                    <div class='title' >${event.data.item[i].name}  </div>
                </div>
                </div>`
                );
            }
            state = true;
            $(".card").on("click", function() {
                var price = $(this).attr('id');
                var itemcode = $(this).attr('itemcode');
                var itemsname = $(this).attr('label');
                $.post("http://Codem-Market2/itemdata", JSON.stringify({
                    price: price,
                    itemcode: itemcode,
                    itemsname: itemsname
                }));
            })
        }
    })
});


$(document).keydown(function(e) {
    if (e.keyCode == 27) {
        $('.anasayfa').hide();
        $.post('http://Codem-Market2/escape');
        document.querySelectorAll(".card").forEach(function(a) { a.remove() })
    }
});