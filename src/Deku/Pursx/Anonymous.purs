module Deku.Pursx.Anonymous where

import Data.Reflectable (class Reflectable)
import Data.Symbol (class IsSymbol)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Core (Nut)
import Deku.Pursx (class PXStart, class PursxToElement, (~~))
import Prim.Row (class Cons, class Lacks)
import Prim.RowList as RL
import Prim.Symbol (class Append)
import Record (insert)
import Type.Proxy (Proxy(..))

data EndAnonymousPursX = EndAnonymousPursX

class
  PursxStringAnonymous accumulator next res where
  pursxStringAnonymous :: accumulator -> next -> res

instance endOfTheLine ::
  ( Reflectable html String
  , PXStart "~" " " html r
  , RL.RowToList r rl
  , PursxToElement rl r
  ) =>
  PursxStringAnonymous (Proxy ll /\ Proxy html /\ { | r })
    EndAnonymousPursX
    (Nut) where
  pursxStringAnonymous (_ /\ a /\ b) _ = a ~~ b

instance readingPursx ::
  ( Append html newHtml combinedHtml
  , PursxValAnonymous (Proxy ll /\ Proxy combinedHtml /\ { | r }) i o
  ) =>
  PursxStringAnonymous (Proxy ll /\ Proxy html /\ { | r })
    (Proxy newHtml)
    (i -> o) where
  pursxStringAnonymous (ll /\ _ /\ b) _ = pursxValAnonymous
    (ll /\ (Proxy :: _ combinedHtml) /\ b)

class
  PursxValAnonymous accumulator next res where
  pursxValAnonymous :: accumulator -> next -> res

instance endOfTheLineV ::
  ( Reflectable html String
  , PXStart "~" " " html r
  , RL.RowToList r rl
  , PursxToElement rl r
  ) =>
  PursxValAnonymous (Proxy ll /\ Proxy html /\ { | r })
    EndAnonymousPursX
    (Nut) where
  pursxValAnonymous (_ /\ a /\ b) _ = a ~~ b

else instance readingVal ::
  ( Append ll "a" lll
  , IsSymbol ll
  , Lacks ll r'
  , Append html " ~" html'
  , Append html' ll html''
  , Append html'' "~ " newHtml
  , Cons ll anything r' r
  , PursxStringAnonymous (Proxy lll /\ Proxy newHtml /\ { | r }) i o
  ) =>
  PursxValAnonymous (Proxy ll /\ Proxy html /\ { | r' })
    anything
    (i -> o) where
  pursxValAnonymous (ll /\ _ /\ b) c = pursxStringAnonymous
    ((Proxy :: _ lll) /\ (Proxy :: _ newHtml) /\ (insert ll c b))

px
  :: forall next res
   . PursxStringAnonymous (Proxy "a" /\ Proxy "" /\ {}) next res
  => next
  -> res
px = pursxStringAnonymous ((Proxy :: _ "a") /\ (Proxy :: _ "") /\ {})

xp :: EndAnonymousPursX
xp = EndAnonymousPursX