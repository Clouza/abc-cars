
    <footer>
        <div class="container mx-auto footer-content">
            <div class="header">
                <h2>ABC Cars</h2>
                <ul>
                    <li>
                        <a href="https://facebook.com" target="_blank"><i class='bx bxl-facebook-circle'></i></a>
                    </li>
                    <li>
                        <a href="https://instagram.com" target="_blank"><i class='bx bxl-instagram'></i></a>
                    </li>
                    <li>
                        <a href=""><i class='bx bx-globe'></i></a>
                    </li>
                </ul>
            </div>
            <div class="links">
                <h3>Information</h3>
                <ul>
                    <li>
                        <a href="/about">About us</a>
                    </li>
                    <li>
                        <a href="/contact">Contact us</a>
                    </li>
                </ul>
            </div>

            <div class="links">
                <h3>Auction Cars</h3>
                <ul>
                    <li>
                        <a href="">Categories</a>
                    </li>
                    <li>
                        <a href="">Search a Car</a>
                    </li>
                    <li>
                        <a href="/list-of-cars">Start bidding</a>
                    </li>
                </ul>
            </div>

            <div class="links">
                <h3>Legal</h3>
                <ul>
                    <li>
                        <a href="">Privacy Policy</a>
                    </li>
                    <li>
                        <a href="">Terms and Condition</a>
                    </li>
                </ul>
            </div>

            <div class="links">
                <h3>Other</h3>
                <ul>
                    <li>
                        <a href="">Sitemap</a>
                    </li>
                </ul>
            </div>

            <form action="" class="footer-form">
                <div>
                    <h3>Join the Community</h3>
                    <input type="email" placeholder="Email Address">
                </div>
                <button type="button">Join</button>
            </form>
        </div>
    </footer>

<%
	boolean navScript = request.getParameter("navScript") != null;
%>
	
    <script src="https://code.jquery.com/jquery-3.6.3.slim.js" integrity="sha256-DKU1CmJ8kBuEwumaLuh9Tl/6ZB6jzGOBV/5YpNE2BWc=" crossorigin="anonymous"></script>
   	<script src="<%= request.getParameter("offset") == null ? "js/script.js" : "../js/script.js"%>"></script>
</body>

</html>