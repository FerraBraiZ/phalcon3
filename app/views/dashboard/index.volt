<!doctype html>
<html lang="pt-br">
<head>
    <title>Phalcon 3 - Dashboard</title>
    <style >

        @import url('https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700');

        *,
        *:before,
        *:after {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        ::-webkit-input-placeholder {
            color: #e4e4e4;
        }


        body {
            font-family: "Montserrat";
            margin: 0;
            padding: 0;
        }

        header {
            position: fixed;
            width: 100%;
            color: #fff;
            font-size: 18px;
            line-height:  24px;
            background: #335C7D;
            text-align: left;
            padding-left: 20px;

        }

        main{
            padding: 60px 20px;

        }


        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            grid-gap: 20px;
            align-items: stretch;
        }

        .grid > article {
            border: 1px solid #ccc;
            box-shadow: 2px 2px 6px 0px rgba(0, 0, 0, 0.3);
        }

        .grid > article img {
            max-width: 100%;
        }

        .grid .text {
            padding: 20px;
        }

    </style>
</head>
<body>

{{ flash.output()}}

<header>
    <h1>Dashboard</h1>
</header>

<main class="main">
    <div class="container">
        <main class="grid">
            <article>
                <img src="https://picsum.photos/600/400?image=1083" alt="Sample photo">
                <div class="text">
                    <h3>Seamlessly visualize quality</h3>
                    <p>Collaboratively administrate empowered markets via plug-and-play networks.</p>
                    <a href="https://codepen.io/collection/XdWJOQ/" class="btn btn-primary btn-block">Here's why</a>
                </div>
            </article>
            <article>
                <img src="https://picsum.photos/600/400?image=1063" alt="Sample photo">
                <div class="text">
                    <h3>Completely Synergize</h3>
                    <p>Dramatically engage seamlessly visualize quality intellectual capital without superior collaboration and idea-sharing.</p>
                    <a href="https://codepen.io/collection/XdWJOQ/" class="btn btn-primary btn-block">Here's how</a>
                </div>
            </article>
            <article>
                <img src="https://picsum.photos/600/400?image=1056" alt="Sample photo">
                <div class="text">
                    <h3>Dynamically Procrastinate</h3>
                    <p>Completely synergize resource taxing relationships via premier niche markets.</p>
                    <a href="https://codepen.io/collection/XdWJOQ/" class="btn btn-primary btn-block">Read more</a>
                </div>
            </article>
            <article>
                <img src="https://picsum.photos/600/400?image=1050" alt="Sample photo">
                <div class="text">
                    <h3>Best in class</h3>
                    <p>Imagine jumping into that boat, and just letting it sail wherever the wind takes you...</p>
                    <a href="https://codepen.io/collection/XdWJOQ/" class="btn btn-primary btn-block">Just do it...</a>
                </div>
            </article>
            <article>
                <img src="https://picsum.photos/600/400?image=1041" alt="Sample photo">
                <div class="text">
                    <h3>Dynamically innovate supply chains</h3>
                    <p>Holisticly predominate extensible testing procedures for reliable supply chains.</p>
                    <a href="https://codepen.io/collection/XdWJOQ/" class="btn btn-primary btn-block">Here's why</a>
                </div>
            </article>
            <article>
                <img src="https://picsum.photos/600/400?image=1015" alt="Sample photo">
                <div class="text">
                    <h3>Sanity check</h3>
                    <p>Objectively innovate empowered manufactured products whereas parallel platforms.</p>
                    <a href="https://codepen.io/collection/XdWJOQ/" class="btn btn-primary btn-block">Stop here</a>
                </div>
            </article>
        </main>
    </div>
</main>
<footer class="footer">
    <p class="footer--text">&copy; uia!</p>
</footer>

<script type="text/javascript">

</script>

</body>
</html>