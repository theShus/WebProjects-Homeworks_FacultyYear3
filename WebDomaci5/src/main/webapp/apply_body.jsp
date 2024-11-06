<%--
  Created by IntelliJ IDEA.
  User: Shus
  Date: 4/27/2022
  Time: 8:51 PM
  To change this template use File | Settings | File Templates.
--%>

<div class="container">
    <h1>Prijava</h1>
    <br>
    <form action="editMembers.jsp" method="POST">
        <label for="teamName" class="form-label">Naziv tima</label>
        <input type="text" class="form-control" name="teamName" id="teamName" >
        <br>
        <label for="teamEmail" class="form-label">Kontakt email</label>
        <input type="email" class="form-control" name="teamEmail" id="teamEmail">
        <br>
        <label for="teamMoto" class="form-label">Moto tima</label>
        <input type="text" class="form-control" name="teamMoto" id="teamMoto">
        <br>
        <label for="phoneNumber" class="form-label">Kontakt telefon</label>
        <input type="text" class="form-control" name="phoneNumber" id="phoneNumber">
        <br>
        <select name="referral" class="form-select">
            <option selected>Kako ste culi za Hakaton?</option>
            <option value="Reklama">Reklama</option>
            <option value="Na fakultetu">Na fakultetu</option>
            <option value="Od kolega">Od kolega</option>
        </select>
        <br>
        <select name="teamSize" class="form-select">
            <option selected>Broj clanova</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
        </select>
        <br>
        <button type="submit" class="btn btn-primary">Clanovi</button>
    </form>
</div>
