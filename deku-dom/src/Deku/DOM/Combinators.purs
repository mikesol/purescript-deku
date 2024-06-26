module Deku.DOM.Combinators where

import Prelude

import Data.Foldable (for_)
import Data.Maybe (Maybe)
import Data.Symbol (class IsSymbol, reflectSymbol)
import Deku.Attribute (Attribute, unsafeAttribute, unset')
import Deku.DOM.Self as Self
import Effect (Effect)
import Effect.Aff (Milliseconds(..), delay, launchAff_)
import Effect.Class (liftEffect)
import Prim.Row as Row
import Type.Proxy (Proxy(..))
import Web.DOM (Element)
import Web.Event.Event as Web
import Web.Event.EventTarget (EventTarget)
import Web.HTML.HTMLInputElement (checked, fromEventTarget, value, valueAsNumber)
import Web.HTML.HTMLSelectElement as SE

transformOn
  :: ∀ a b r f
   . Functor f =>
     { fromEventTarget :: EventTarget -> Maybe a
     , value           :: a -> Effect b
     }
  -> (f (Web.Event -> Effect Unit) -> f (Attribute r))
  -> f (b -> Effect Unit)
  -> f (Attribute r)
transformOn { fromEventTarget, value } listener =
  listener <<< map \push e ->
    for_ (Web.target e >>= fromEventTarget)
       $ value >=> push

-- | Runs an effect when the element triggers the given event. 
runOn
  :: forall e r f
   . Functor f
  => (f (e -> Effect Unit) -> f (Attribute r))
  -> f (Effect Unit)
  -> f (Attribute r)
runOn listener =
  listener <<< map const

-- | Shorthand version of `runOn`.
runOn_
  :: forall e r f
   . Applicative f
  => (f (e -> Effect Unit) -> f (Attribute r))
  -> Effect Unit
  -> f (Attribute r)
runOn_ listener =
  runOn listener <<< pure

-- | Runs an effect with the `checked` value of the target element when it triggers the given event. 
checkedOn
  :: forall r f
   . Functor f
  => (f (Web.Event -> Effect Unit) -> f (Attribute r))
  -> f (Boolean -> Effect Unit)
  -> f (Attribute r)
checkedOn =
  transformOn { fromEventTarget, value: checked }

-- | Shorthand version of `checkedOn`.
checkedOn_
  :: forall r f
   . Applicative f
  => (f (Web.Event -> Effect Unit) -> f (Attribute r))
  -> (Boolean -> Effect Unit)
  -> f (Attribute r)
checkedOn_ listener =
  checkedOn listener <<< pure

-- | Runs an effect with the `valueAsNumber` property of the target element when it triggers the given event.
numberOn
  :: forall r f
   . Functor f
  => (f (Web.Event -> Effect Unit) -> f (Attribute r))
  -> f (Number -> Effect Unit)
  -> f (Attribute r)
numberOn =
  transformOn { fromEventTarget, value: valueAsNumber }

-- | Shorthand version of `numberOn`.
numberOn_
  :: forall r f
   . Applicative f
  => (f (Web.Event -> Effect Unit) -> f (Attribute r))
  -> (Number -> Effect Unit)
  -> f (Attribute r)
numberOn_ listener =
  numberOn listener <<< pure

-- | Runs an effect with the `value` property of the target element when it triggers the given event.
valueOn
  :: forall r f
   . Functor f
  => (f (Web.Event -> Effect Unit) -> f (Attribute r))
  -> f (String -> Effect Unit)
  -> f (Attribute r)
valueOn =
  transformOn { fromEventTarget, value }

-- | Shorthand version of `valueOn`.
valueOn_
  :: forall r f
   . Applicative f
  => (f (Web.Event -> Effect Unit) -> f (Attribute r))
  -> (String -> Effect Unit)
  -> f (Attribute r)
valueOn_ listener =
  valueOn listener <<< pure

-- | Runs an effect with the `value` property of the target select element when it triggers the given event.
selectOn
  :: forall r f
   . Functor f
  => (f (Web.Event -> Effect Unit) -> f (Attribute r))
  -> f (String -> Effect Unit)
  -> f (Attribute r)
selectOn =
  transformOn { fromEventTarget: SE.fromEventTarget, value: SE.value }

-- | Shorthad version of `selectOn`.
selectOn_
  :: forall r f
   . Applicative f
  => (f (Web.Event -> Effect Unit) -> f (Attribute r))
  -> (String -> Effect Unit)
  -> f (Attribute r)
selectOn_ listener =
  selectOn listener <<< pure

-- | Converts an `Attribute` constructor to an `Attribute` unsetter.
-- | 
-- | ```purescript
-- | div [ _class "selected" selected, unset _class unselected ] [ text "button" ]
-- | ```
unset
  :: forall @s v e r' r f
   . IsSymbol s
  => Row.Cons s v r' r
  => Functor f
  => f e
  -> f (Attribute r)
unset trigger = trigger $> unsafeAttribute (unset'
  (fixMe $ reflectSymbol (Proxy :: Proxy s)))
  where
  fixMe "klass" = "class"
  fixMe x = x

-- | Sets a listener that injects a primitive DOM element into a closed scope immediately after element creation.
-- | Importantly, this does _not happen_ on the same tick as the element creation but rather during the next DOM tick.
-- | This is to guarantee that element creation happens before trying to use the element.
-- | In practice this delay will be on the order of microseconds but it can veer into milliseconds if
-- | the UI thread is particularly busy.
injectElement
  :: forall e f
   . Applicative f
  => (Element -> Effect Unit)
  -> f (Attribute e)
injectElement f =
  Self.self_ \s -> launchAff_ do
    delay $ Milliseconds 0.0
    liftEffect $ f s

-- | A typesafe version of `injectElement` that uses `SelfT` instead of `Self`.
injectElementT
  :: forall r f typedElement tag
   . Applicative f
  => Self.IsSelf typedElement tag
  => (typedElement -> Effect Unit)
  -> f (Attribute (__tag :: Proxy tag | r))
injectElementT f =
  Self.selfT_ \s -> launchAff_ do
    delay $ Milliseconds 0.0
    liftEffect $ f s
