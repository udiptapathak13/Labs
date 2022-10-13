<html>
    <head>
        <title>
            DonorCamp
        </title>
        <link rel = "stylesheet" href = "style.css">
    </head>
    <body>
        <header>    
            <h1>
                Give Your Blood
            </h1>
        </header>
        <article>
            <h2>
                Best Place to Give Your Blood
            </h2>
            <form method = "post" action = "insert.php">
                <div class = 'txtin'>
                    <label>
                        Name
                    </label>
                    <input type = 'text' name = "name">
                </div>
                <div class = 'txtin'>
                    <label>
                        Region
                    </label>
                    <input type = 'text' name = "region">
                </div>
                <div class = 'txtin'>
                    <label>
                        Phone
                    </label>
                    <input type = 'text' name = "phone">
                </div>
                <div class = 'txtin'>
                    <label>
                        Blood Group
                    </label>
                    <input type = 'text' name = "grp">
                </div>
                <input type = 'submit' value = 'Submit'>
            </form>
        </article>
    </body>    
</html>