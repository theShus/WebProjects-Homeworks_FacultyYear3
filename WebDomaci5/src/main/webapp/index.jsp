<%@ page import="java.io.File" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="styles.jsp" %>
    <style><%@include file="/WEB-INF/custom.css"%></style>

</head>
<body>
<%--https://www.w3schools.com/w3css/w3css_cards.asp--%>
    <%@ include file="navBar.jsp" %>

<div class="container-fluid" style="padding-top: 100px; padding-bottom: 50px">
        <div class="container px-5 text-center" >
            <h1>Da li možeš da osvojiš RAF?</h1>
            <h2>RAF Hakaton</h2>
            <br/>
            <a href="apply.jsp" class="button button1">Apply!</a>
            <br/>
        </div>
    </div>
    <div class="title text-center">
        <h1>O takmičenju</h1>
    </div>

    <div class="container-fluid  text-center" style="margin-top: 150px">
        <div class="container px-5">
            <div class="row row-cols-1 row-cols-md-3  g-4">
                <div class="col" >
                    <div class="card" style="border: none">
                        <img src="https://hakaton.raf.edu.rs/assets/images/icons/calendar.png"
                             class="card-img-top mx-auto mt-2" alt="..." style="width:   60px">
                        <div class="card-body">
                            <h5 class="card-title">Vreme</h5>
                            <p class="card-text">Takmičenje će početi u subotu, 21. decembra, o tačnoj satnici takmičari
                                će biti naknadno obavešteni. Hakaton traje 24 sata od trenutka prezentovanja teme.</p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card" style="border: none">
                        <img src="https://hakaton.raf.edu.rs/assets/images/icons/lokacija.png"
                             class="card-img-top mx-auto mt-2" alt="..." style="width:   60px">
                        <div class="card-body">
                            <h5 class="card-title">Mesto</h5>
                            <p class="card-text">Hakaton će se održati na Računarskom fakultetetu. Fakultet se nalazi u
                                samom centru Beograda, u Knez Mihailovoj 6/VI. Svakom timu će biti dodeljena posebna
                                učionica za rad.</p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card" style="border: none">
                        <img src="https://hakaton.raf.edu.rs/assets/images/icons/idea.png"
                             class="card-img-top mx-auto mt-2" alt="..." style="width: 50px">
                        <div class="card-body">
                            <h5 class="card-title">Tema</h5>
                            <p class="card-text">Tema će biti poznata na dan takmičenja. Tada će timovi dobiti sve neophodne informacije i biće upoznati sa zadatkom. Tačno 12 sati nakon početka, svim takmičarima biće predstavljen još jedan zahtev koji bi trebalo da ispune.</p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card" style="border: none">
                        <img src="https://hakaton.raf.edu.rs/assets/images/icons/ucesce.png"
                             class="card-img-top mx-auto mt-2" alt="..." style="width:   60px">
                        <div class="card-body">
                            <h5 class="card-title">Učešće</h5>
                            <p class="card-text">Takmičenje je otvorenog tipa, a pravo na učešće imaju svi od 18 do 27
                                godina. Na hakatonu će učestvovati najboljih 8 timova sa 3 do 4 člana.</p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card" style="border: none">
                        <img src="https://hakaton.raf.edu.rs/assets/images/icons/ocenjivanje.png"
                             class="card-img-top mx-auto mt-2" alt="..." style="width:   60px">
                        <div class="card-body">
                            <h5 class="card-title">Ocenjivanje</h5>
                            <p class="card-text">Rešenja će biti ocenjena od strane stručnog žirija u više različitih
                                kategorija. Sa tačnim načinom ocenjivanja takmičari će biti upoznati pred početak
                                takmičenja. Žiri će, u toku trajanja takmičenja, nadgledati radove takmičara i po
                                završetku Hakatona doneti konačnu odluku.</p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card" style="border: none">
                        <img src="https://hakaton.raf.edu.rs/assets/images/icons/Resursi.png"
                             class="card-img-top mx-auto mt-2" alt="..." style="width:   60px">
                        <div class="card-body">
                            <h5 class="card-title">Resursi</h5>
                            <p class="card-text">U toku trajanja hakatona, takmičarima će biti obezbeđena hrana, piće,
                                internet i prostor za zabavu i odmor. Takmičari su u obavezi da donesu laptopove na
                                kojima će raditi, dok će im dodatni resursi kao što su monitori, tastature, miševi,
                                papiri itd. biti obezebeđeni.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container" style="padding-top: 100px">
        <div class="title text-center">
            <h1>Osvoji nagrade</h1>
            <br/>
        </div>
        <div class="row no-gutters text-center">
            <div class="col-md-4 order-2 order-md-1">
                <div>
                    <h2 class="mb-3">Drugo mesto</h2>
                    <img src="https://hakaton.raf.edu.rs/assets/images/crypto/ethereum_cricle.png" alt="Ethereum"
                         class="mx-auto" style="width: 150px">
                    <p class="mt-3" style="line-height:0.8em;">50 000</p>
                    <p  style="line-height:0.8em;">dinara</p>
                    <p style="font-size:1.3em;" class="mt-5">U Ethereum kriptovaluti</p>

                </div>
            </div>
            <div class="col-md-4 order-1 order-md-2 reward-custom-padding">
                <div>
                    <h2 class="mb-3">Prvo mesto</h2>
                    <img src="https://hakaton.raf.edu.rs/assets/images/crypto/bitcoin_circle.png" alt="Bitcoin"
                         class="mx-auto" style="width: 150px">
                    <p class="mt-3" style="line-height:0.8em;">100 000</p>
                    <p style="line-height:0.8em;">dinara</p>
                    <p style="font-size:1.3em;" class="mt-5">U Bitcoin kriptovaluti</p>

                </div>
            </div>
            <div class="col-md-4 order-3 order-md-3 reward-custom-padding">
                <div>
                    <h2 class="mb-3">Treće mesto</h2>
                    <img src="https://hakaton.raf.edu.rs/assets/images/crypto/ethereum_cricle.png" alt="Ethereum"
                         class="mx-auto" style="width: 150px">
                    <p class="mt-3" style="line-height:0.8em;">25 000</p>
                    <p style="line-height:0.8em;">dinara</p>
                    <p style="font-size:1.3em;" class="mt-5">U Ethereum kriptovaluti</p>

                </div>
            </div>

        </div>
    </div>
</body>
<footer class="container-fluid mb-5" style="padding-top: 150px">
        <div class="container text-center">
            <div class="row">
                <div class="col-6 col-xl-3">
                        <div class="media">
                            <i class="fa fa-map-marker text-white"></i>
                            <div class="media-body ml-3">
                                <h6>Mesto održavanja</h6>
                                <a href="https://goo.gl/maps/ycUBttET9eLXqLx29" target="_blank" class="footer-link">Računarski
                                    fakultet, <br>
                                    Knez Mihailova 6/VI</a>
                            </div>
                        </div>
                </div>
                <div class="col-6 col-xl-3">
                        <div class="media">
                            <i class="fa fa-envelope-o text-white"></i>
                            <div class="media-body ml-3">
                                <h6>Imate pitanja?</h6>
                                <a href="mailto:hakaton@raf.rs" class="footer-link">hakaton@raf.rs</a>
                            </div>
                        </div>
                </div>
                <div class="col-6 col-xl-3">
                    <div class="single-widget contact-widget">
                        <div class="media">
                            <i class="fa fa-phone text-white"></i>
                            <div class="media-body ml-3">
                                <h6>Pozovite nas</h6>
                                <a href="tel:011 33 48 079" class="footer-link"> 011 33 48 079</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-xl-3">
                        <div class="media">
                            <img style="max-width:150px;" src="https://hakaton.raf.edu.rs/assets/images/Hakaton_logo.png" alt="RAF Hakaton">
                        </div>
                </div>
            </div>
        </div>
</footer>
</html>