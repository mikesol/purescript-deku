module Deku.Example.Docs.SSR where

import Prelude

import Control.Alt ((<|>))
import Deku.Control (text, text_)
import Deku.Core (Nut, vbussed)
import Deku.DOM as D
import Deku.Listeners (click_, slider)
import Deku.Pursx (nut, (~~))
import Deku.Toplevel (Template(..), runSSR)
import Examples as Examples
import FRP.Event (fold, makePureEvent)
import FRP.Event.VBus (V)
import Type.Proxy (Proxy(..))

type UIEvents = V
  ( buttonClicked :: Unit
  , sliderMoved :: Number
  )

px =
  Proxy
    :: Proxy
         """<div>
  <h1>Server-side rendering</h1>

  <h2>When performance matters!</h2>
  <p>
    In web development, it's good practice to send a plain-HTML version of your site over the wire before any JavaScript starts executing. This is called <i>server-side rendering</i>, or SSR, where the server renders HTML in an initial pass before rendering any JavaScript.
  </p>
  <p>
    The most performant form of SSR is pre-rendering HTML and serving them from memory or from a file system. This is Deku's strategy via the following two functions:
  </p>
  <ul>
    <li><code>runSSR</code> generates HTML; and</li>
    <li><code>hydrate</code> generates JavaScript that will hydrate your HTML with anything that's dynamic. Note that this is <i>partial</i> hydration, meaning it will only hydrate the bits that need hydrating. This means that, for example, you can do CSS animations on load without fear of jank when the JavaScript kicks in.</li>
  </ul>

  <p>
    This documentation is generated using SSR, and if you add <code>view-source:</code> before the URL, you'll see the intro page rendered as HTML. If you're reading this documentation on a computer screen, you won't see much of a difference, but if you're reading it on a 3G mobile network, you'll spot the difference immedaitely.
  </p>

  <h2>A motivating example</h2>

  <p>Here is a small application using SSR. We'll split it up into three files:</p>
  <ul>
    <li><code>App.purs</code> has our application logic.</li>
    <li><code>Build.purs</code> creates a <code>.js</code> file, for example <code>make.js</code>, that will render our HTML.</li>
    <li><code>Live.purs</code> uses hydration to add dynamic logic to the website.</li>
  </ul>

  <h3>App</h3>
  <p>Unlike the previous examples that used <code>runInBody</code>, our application code here has an explicit type annotation <code>Nut</code>. The definition of <code>Nut</code> is <code>type Nut = forall s m lock payload. Korok s m => Domable m lock payload</code>, and in larger projects, you may need to write this type out explicitly, for example if you are working with an <code>Array</code> of <code>Domable</code> and need <code>m</code> to be consistant over the <code>Array</code>.</p>
  ~code0~
  <h3>Build</h3>
  <p>This is the code we use to generate our HTML site. The example below creates a small script that logs our HTML to the command line,but we can also call <code>runSSR</code> from a NodeJS server, in which case we wouldn't <code>log</code> the HTML string but rather we would instead send it over the wire as the response to a request.</p>
  ~code1~
  <h3>Live</h3>
  <p><code>Live.purs</code> can be bundled to generate our dynamic JS. The JS will hydrate our elements instead of replacing them, and will only hydrate elements that potentially will interactive content.</p>
  ~code2~

  <h3>Result</h3>

  <p>Here is the resulting code from our static-site generation. It is rendered dynamically in your browser, but in production settings, we'd use NodeJS to render or pre-render this HTML.</p>

  ~codegen~

  <p>And here is what the result looks like after hydration.</p>

  <blockquote> ~result~ </blockquote>

  <p>One important thing to note about SSR is that it leaves a lot of things out. For example, it will not respond to send-to-position requests if they are emitted immediately. These are only evaluated on the client once a document is rendered. For this reason, it is recommended to <i>only</i> use SSR for elements that should be statically rendered, like a loading screen or blog. If you need your initial HTML to reflect lots of inserting and deleting of dynamic nodes, deku SSR may not work for you yet.</p>

  <h2>Parting shot</h2>
  <p>Thanks for checking out Deku! I had a blast writing it, and I hope you enjoy using it for your projects!</p>
</div>"""

app :: Nut
app = vbussed (Proxy :: _ UIEvents) \push event -> do
  D.div_
    [ D.p_
        [ text_
            """Here's an example of SSR in deku.
All of the static bits are rendered as HTML,
and all of the dynamic bits are hydrated on page load."""
        ]
    , D.button
        (click_ $ push.buttonClicked unit)
        [ text_ "Click" ]
    , D.div_
        [ text
            ( pure "Val: 0" <|>
                ( append "Val: " <<< show
                    <$> fold
                      (const (add 1))
                      (pure unit <|> event.buttonClicked)
                      (-1)
                )
            )
        ]
    , D.div_
        [ D.input
            (slider (pure push.sliderMoved))
            []
        , D.div_
            [ text
                ( pure "Val: 50" <|>
                    ( map
                        (append "Val: " <<< show)
                        event.sliderMoved
                    )
                )
            ]
        ]
    ]

ssrPage :: forall i. i -> Nut
ssrPage _ = px ~~
  { code2: nut
      ( D.pre_
          [ D.code_
              [ text_ Examples.live
              ]
          ]
      )
  , code1: nut
      ( D.pre_
          [ D.code_
              [ text_ Examples.build
              ]
          ]
      )
  , code0: nut
      ( D.pre_
          [ D.code_
              [ text_ Examples.app
              ]
          ]
      )
  , result: nut app
  , codegen: nut
      ( D.pre_
          [ D.code_
              [ text
                  ( makePureEvent \k ->
                      ( 
                          ( runSSR
                              ( Template
                                  { head:
                                      "<!DOCTYPE html><html><head><script src=\"bundle.js\" defer></script></head>"
                                  , tail: "</html>"
                                  }
                              )
                              app
                          ) >>= k
                      ) *> (pure (pure unit))
                  )
              ]
          ]
      )
  }