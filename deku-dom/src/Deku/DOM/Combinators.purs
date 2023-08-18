module Deku.DOM.Combinators where

import Prelude

import Data.Foldable (for_)
import Deku.Attribute (Attribute, AttributeValue(..), unsafeAttribute, unsafeUnAttribute)
import Deku.DOM.Self as Self
import Effect (Effect)
import Effect.Aff (Milliseconds(..), delay, launchAff_)
import Effect.Class (liftEffect)
import FRP.Event (Event)
import Type.Proxy (Proxy)
import Web.DOM (Element)
import Web.Event.Event as Web
import Web.HTML.HTMLInputElement (checked, fromEventTarget, value, valueAsNumber)

runOn :: forall e r
   . ( Event ( e -> Effect Unit ) -> Event ( Attribute r ) )
  -> Event ( Effect Unit )
  -> Event ( Attribute r )
runOn listener =
  listener <<< map const 

runOn_ :: forall e r
   . ( Event ( e -> Effect Unit ) -> Event ( Attribute r ) )
  -> Effect Unit
  -> Event ( Attribute r )
runOn_ listener =
  runOn listener <<< pure

checkedOn :: forall r
   . ( Event ( Web.Event -> Effect Unit ) -> Event ( Attribute r ) )
  -> Event ( Boolean -> Effect Unit )
  -> Event ( Attribute r )
checkedOn listener =
  listener <<< map \push e -> for_ ( Web.target e >>= fromEventTarget ) $ checked >=> push

checkedOn_ :: forall r
   . ( Event ( Web.Event -> Effect Unit ) -> Event ( Attribute r ) )
  -> ( Boolean -> Effect Unit )
  -> Event ( Attribute r )
checkedOn_ listener = 
  checkedOn listener <<< pure

numberOn :: forall r
   . ( Event ( Web.Event -> Effect Unit ) -> Event ( Attribute r ) )
  -> Event ( Number -> Effect Unit )
  -> Event ( Attribute r )
numberOn listener =
  listener <<< map \push e -> for_ ( Web.target e >>= fromEventTarget ) $ valueAsNumber >=> push

numberOn_ :: forall r
   . ( Event ( Web.Event -> Effect Unit ) -> Event ( Attribute r ) )
  -> ( Number -> Effect Unit )
  -> Event ( Attribute r )
numberOn_ listener =
  numberOn listener <<< pure

valueOn :: forall r
   . ( Event ( Web.Event -> Effect Unit ) -> Event ( Attribute r ) )
  -> Event ( String -> Effect Unit )
  -> Event ( Attribute r )
valueOn listener =
  listener <<< map \push e -> for_ ( Web.target e >>= fromEventTarget ) $ value >=> push

valueOn_ :: forall r
   . ( Event ( Web.Event -> Effect Unit ) -> Event ( Attribute r ) )
  -> ( String -> Effect Unit )
  -> Event ( Attribute r )
valueOn_ listener =
  valueOn listener <<< pure

-- | Converts an `Attribute` constructor to an `Attribute` unsetter.
-- | 
-- | ```purescript
-- | div [ _class "selected" selected, unset _class unselected ] [ text "button" ]
-- | ```
unset
  :: forall e a r
   . Monoid a
  => (Event a -> Event (Attribute r))
  -> Event e
  -> Event (Attribute r)
unset attr trigger =
  unsafeAttribute <<< _ { value = Unset' } <<< unsafeUnAttribute <$> attr
    (const mempty <$> trigger)

-- | Sets a listener that injects a primitive DOM element into a closed scope immediately after element creation.
-- | Importantly, this does _not happen_ on the same tick as the element creation but rather during the next DOM tick.
-- | This is to guarantee that element creation happens before trying to use the element.
-- | In practice this delay will be on the order of microseconds but it can veer into milliseconds if
-- | the UI thread is particularly busy.
injectElement
  :: forall e
   . (Element -> Effect Unit)
  -> Event (Attribute e)
injectElement f =
  Self.self_ \s -> launchAff_ do
    delay $ Milliseconds 0.0
    liftEffect $ f s

-- | A typesafe version of `injectElement` that uses `SelfT` instead of `Self`.
injectElementT
  :: forall r typedElement tag
   . Self.IsSelf typedElement tag
  => (typedElement -> Effect Unit)
  -> Event (Attribute (__tag :: Proxy tag | r))
injectElementT f =
  Self.selfT_ \s -> launchAff_ do
    delay $ Milliseconds 0.0
    liftEffect $ f s