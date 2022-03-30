module Deku.Example.Docs.Subgraphs where

import Prelude

import Deku.Core (Element)
import Deku.DOM as D
import Deku.Example.Docs.Types (Page)
import Deku.Pursx (nut, (~~))
import Effect (Effect)
import Type.Proxy (Proxy(..))

px = Proxy :: Proxy """<div>
  <h1>Subgraphs</h1>

  <h2>Inter-component communication</h2>
  <p>
    As your app gets larger, you'll want to split up your code into logical components. Besides making the code easier to work with, in Deku, this allows us to change child components on the fly without changing the type of the parent graph. We call these subgraphs.</p>

  <p>In the code below, two subgraphs are divided by a horizontal line. They communicate with each other via message passing, and they also have internal messaging.</p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>Subgraph anatomy</h2>

  <p>Subgraphs are not unlike the root components we've been working with all along. There are, however, a few key differences to be aware of.</p>

  <h3>The event</h3>

  <code>Subgraph</code>-s, like <code>Element</code>-s, receive an <code>Event</code> as their first arguemnt. However, unlike <code>Element</code>-s, this <code>Event</code> contains a <code>Tuple</code> of shape <code>Tuple index  (SubgraphAction env)</code>.

  The first part of the <code>Tuple</code> is the index of the subgraph. Each subgraph has a unique hashable index.

  The second part of the <code>Tuple</code> is a <code>SubgraphAction</code>, which is one of the three following things:

  <ul>
    <li><code>InsertOrUpdate env</code>: Inserts or updates a subgraph, pushing the contents of <code>env</code> to it. We'll see how the subgraph receives this content in a bit.</li>
    <li><code>SendToTop</code>: Sends the subgraph to the top of its enclosing element. Note that, if the enclosing element contains other elements besides the subgraph, it will leapfrog those as well, which is not what you want in most cases. To avoid this, as standard practice, a subgraph should be the unique child of its enclosing element.</li>
    <li><code>Remove</code>: Remove a subgraph from the DOM.</li>
  </ul>

  <h3>The creation function</h3>
  The second and last argument to <code>subgraph</code> is the subgraph creation function. This takes three arguments:

  <ul>
    <li>The index of this particular subgraph</li>
    <li>A pusher for this subgraph. Things pushed to this pusher will be propagated <i>only</i> to this particular subgraph, meaning its parent and its siblings will not receive these pushes.</li>
    <li>An event of type <code>Event (Either env push)</code>. It responds to <i>both</i> external communication when created and updated (on the <code>Left</code>) <i>and</i> to input from the pusher (on the <code>Right</code>).</li>
  </ul>

  <p>Using this pattern, you can create the behavior of dynamic websites with little or no overhead. For example, the navigation links on this page are implemented as subgraph, and as you can see, they are quite fast!</p>

  <h2>Parting shot</h2>
  <p>Thanks for checking out Deku! I had a blast writing it, I hope you have fun using it too 😊</p>
</div>"""

subgraphs :: (Page -> Effect Unit) -> Element
subgraphs dpage  = px ~~
  { code: nut (D.div_ [])
  , result: nut (D.div_ [])
  }