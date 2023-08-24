module Deku.DOM.Combinators where

import Prelude

import Data.Foldable (for_)
import Deku.Attribute (Attribute, AttributeValue(..), unsafeAttribute, unsafeUnAttribute)
import Deku.DOM.Self as Self
import Effect (Effect)
import Effect.Aff (Milliseconds(..), delay, launchAff_)
import Effect.Class (liftEffect)
import FRP.Poll (Poll)
import Type.Proxy (Proxy)
import Web.DOM (Element)
import Web.Event.Event as Web
import Web.HTML.HTMLInputElement (checked, fromEventTarget, value, valueAsNumber)

-- | Runs an effect when the element triggers the given event. 
runOn :: forall e r
   . ( Poll ( e -> Effect Unit ) -> Poll ( Attribute r ) )
  -> Poll ( Effect Unit )
  -> Poll ( Attribute r )
runOn listener =
  listener <<< map const 

-- | Shorthand version of `runOn`.
runOn_ :: forall e r
   . ( Poll ( e -> Effect Unit ) -> Poll ( Attribute r ) )
  -> Effect Unit
  -> Poll ( Attribute r )
runOn_ listener =
  runOn listener <<< pure

-- | Runs an effect with the `checked` value of the target element when it triggers the given event. 
checkedOn :: forall r
   . ( Poll ( Web.Event -> Effect Unit ) -> Poll ( Attribute r ) )
  -> Poll ( Boolean -> Effect Unit )
  -> Poll ( Attribute r )
checkedOn listener =
  listener <<< map \push e -> for_ ( Web.target e >>= fromEventTarget ) $ checked >=> push

-- | Shorthand version of `checkedOn`.
checkedOn_ :: forall r
   . ( Poll ( Web.Event -> Effect Unit ) -> Poll ( Attribute r ) )
  -> ( Boolean -> Effect Unit )
  -> Poll ( Attribute r )
checkedOn_ listener = 
  checkedOn listener <<< pure

-- | Runs an effect with the `valueAsNumber` property of the target element when it triggers the given event.
numberOn :: forall r
   . ( Poll ( Web.Event -> Effect Unit ) -> Poll ( Attribute r ) )
  -> Poll ( Number -> Effect Unit )
  -> Poll ( Attribute r )
numberOn listener =
  listener <<< map \push e -> for_ ( Web.target e >>= fromEventTarget ) $ valueAsNumber >=> push

-- | Shorthand version of `numberOn`.
numberOn_ :: forall r
   . ( Poll ( Web.Event -> Effect Unit ) -> Poll ( Attribute r ) )
  -> ( Number -> Effect Unit )
  -> Poll ( Attribute r )
numberOn_ listener =
  numberOn listener <<< pure

-- | Runs an effect with the `value` property of the target element when it triggers the given event.
valueOn :: forall r
   . ( Poll ( Web.Event -> Effect Unit ) -> Poll ( Attribute r ) )
  -> Poll ( String -> Effect Unit )
  -> Poll ( Attribute r )
valueOn listener =
  listener <<< map \push e -> for_ ( Web.target e >>= fromEventTarget ) $ value >=> push

-- | Shorthand version of `valueOn`.
valueOn_ :: forall r
   . ( Poll ( Web.Event -> Effect Unit ) -> Poll ( Attribute r ) )
  -> ( String -> Effect Unit )
  -> Poll ( Attribute r )
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
  => (Poll a -> Poll (Attribute r))
  -> Poll e
  -> Poll (Attribute r)
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
  -> Poll (Attribute e)
injectElement f =
  Self.self_ \s -> launchAff_ do
    delay $ Milliseconds 0.0
    liftEffect $ f s

-- | A typesafe version of `injectElement` that uses `SelfT` instead of `Self`.
injectElementT
  :: forall r typedElement tag
   . Self.IsSelf typedElement tag
  => (typedElement -> Effect Unit)
  -> Poll (Attribute (__tag :: Proxy tag | r))
injectElementT f =
  Self.selfT_ \s -> launchAff_ do
    delay $ Milliseconds 0.0
    liftEffect $ f s