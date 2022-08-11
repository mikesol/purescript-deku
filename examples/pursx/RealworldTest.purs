module Deku.Example.Pursx.RealworldTest where

import Prelude

import Deku.Pursx ((~~))
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Type.Proxy (Proxy(..))

-- from realworld
nav_ =
  Proxy :: Proxy """<nav class="navbar navbar-light">
    <div class="container">
        <a class="navbar-brand" href="index.html">conduit</a>
        <ul class="nav navbar-nav pull-xs-right">
            <li class="nav-item">
                <!-- Add "active" class when you're on that page" -->
                <a class="nav-link active" href="">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="">
                    <i class="ion-compose"></i>&nbsp;New Article
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="">
                    <i class="ion-gear-a"></i>&nbsp;Settings
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="">Sign in</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="">Sign up</a>
            </li>
        </ul>
    </div>
</nav>
"""

nav :: Effect Unit
nav = runInBody (nav_ ~~ {})

home_ =
  Proxy :: Proxy """<div class="home-page">

    <div class="banner">
        <div class="container">
            <h1 class="logo-font">conduit</h1>
            <p>A place to share your knowledge.</p>
        </div>
    </div>

    <div class="container page">
        <div class="row">

            <div class="col-md-9">
                <div class="feed-toggle">
                    <ul class="nav nav-pills outline-active">
                        <li class="nav-item">
                            <a class="nav-link disabled" href="">Your Feed</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="">Global Feed</a>
                        </li>
                    </ul>
                </div>

                <div class="article-preview">
                    <div class="article-meta">
                        <a href="profile.html"><img src="http://i.imgur.com/Qr71crq.jpg"/></a>
                        <div class="info">
                            <a href="" class="author">Eric Simons</a>
                            <span class="date">January 20th</span>
                        </div>
                        <button class="btn btn-outline-primary btn-sm pull-xs-right">
                            <i class="ion-heart"></i> 29
                        </button>
                    </div>
                    <a href="" class="preview-link">
                        <h1>How to build webapps that scale</h1>
                        <p>This is the description for the post.</p>
                        <span>Read more...</span>
                    </a>
                </div>

                <div class="article-preview">
                    <div class="article-meta">
                        <a href="profile.html"><img src="http://i.imgur.com/N4VcUeJ.jpg"/></a>
                        <div class="info">
                            <a href="" class="author">Albert Pai</a>
                            <span class="date">January 20th</span>
                        </div>
                        <button class="btn btn-outline-primary btn-sm pull-xs-right">
                            <i class="ion-heart"></i> 32
                        </button>
                    </div>
                    <a href="" class="preview-link">
                        <h1>The song you won't ever stop singing. No matter how hard you try.</h1>
                        <p>This is the description for the post.</p>
                        <span>Read more...</span>
                    </a>
                </div>

            </div>

            <div class="col-md-3">
                <div class="sidebar">
                    <p>Popular Tags</p>

                    <div class="tag-list">
                        <a href="" class="tag-pill tag-default">programming</a>
                        <a href="" class="tag-pill tag-default">javascript</a>
                        <a href="" class="tag-pill tag-default">emberjs</a>
                        <a href="" class="tag-pill tag-default">angularjs</a>
                        <a href="" class="tag-pill tag-default">react</a>
                        <a href="" class="tag-pill tag-default">mean</a>
                        <a href="" class="tag-pill tag-default">node</a>
                        <a href="" class="tag-pill tag-default">rails</a>
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>
"""

home :: Effect Unit
home = runInBody (home_ ~~ {})


profile_ =
  Proxy :: Proxy """<div class="profile-page">

    <div class="user-info">
        <div class="container">
            <div class="row">

                <div class="col-xs-12 col-md-10 offset-md-1">
                    <img src="http://i.imgur.com/Qr71crq.jpg" class="user-img"/>
                    <h4>Eric Simons</h4>
                    <p>
                        Cofounder @GoThinkster, lived in Aol's HQ for a few months, kinda looks like Peeta from the
                        Hunger Games
                    </p>
                    <button class="btn btn-sm btn-outline-secondary action-btn">
                        <i class="ion-plus-round"></i>
                        &nbsp;
                        Follow Eric Simons
                    </button>
                </div>

            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">

            <div class="col-xs-12 col-md-10 offset-md-1">
                <div class="articles-toggle">
                    <ul class="nav nav-pills outline-active">
                        <li class="nav-item">
                            <a class="nav-link active" href="">My Articles</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="">Favorited Articles</a>
                        </li>
                    </ul>
                </div>

                <div class="article-preview">
                    <div class="article-meta">
                        <a href=""><img src="http://i.imgur.com/Qr71crq.jpg"/></a>
                        <div class="info">
                            <a href="" class="author">Eric Simons</a>
                            <span class="date">January 20th</span>
                        </div>
                        <button class="btn btn-outline-primary btn-sm pull-xs-right">
                            <i class="ion-heart"></i> 29
                        </button>
                    </div>
                    <a href="" class="preview-link">
                        <h1>How to build webapps that scale</h1>
                        <p>This is the description for the post.</p>
                        <span>Read more...</span>
                    </a>
                </div>

                <div class="article-preview">
                    <div class="article-meta">
                        <a href=""><img src="http://i.imgur.com/N4VcUeJ.jpg"/></a>
                        <div class="info">
                            <a href="" class="author">Albert Pai</a>
                            <span class="date">January 20th</span>
                        </div>
                        <button class="btn btn-outline-primary btn-sm pull-xs-right">
                            <i class="ion-heart"></i> 32
                        </button>
                    </div>
                    <a href="" class="preview-link">
                        <h1>The song you won't ever stop singing. No matter how hard you try.</h1>
                        <p>This is the description for the post.</p>
                        <span>Read more...</span>
                        <ul class="tag-list">
                            <li class="tag-default tag-pill tag-outline">Music</li>
                            <li class="tag-default tag-pill tag-outline">Song</li>
                        </ul>
                    </a>
                </div>


            </div>

        </div>
    </div>

</div>
"""

profile :: Effect Unit
profile = runInBody (profile_ ~~ {})