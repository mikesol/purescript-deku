module Deku.DOM.Attr.OnTransitionend where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTransitionend = OnTransitionend

instance Attr anything OnTransitionend (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnTransitionend bothValues = unsafeAttribute $ Both (pure 
    { key: "transitionend", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "transitionend", value: cb' value })
instance Attr anything OnTransitionend  Cb  where
  attr OnTransitionend value = unsafeAttribute $ This $ pure $
    { key: "transitionend", value: cb' value }
instance Attr anything OnTransitionend (Event.Event  Cb ) where
  attr OnTransitionend eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitionend", value: cb' value }

instance Attr anything OnTransitionend (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnTransitionend bothValues = unsafeAttribute $ Both (pure 
    { key: "transitionend", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transitionend", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTransitionend  (Effect Unit)  where
  attr OnTransitionend value = unsafeAttribute $ This $ pure $
    { key: "transitionend", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTransitionend (Event.Event  (Effect Unit) ) where
  attr OnTransitionend eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "transitionend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitionend (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnTransitionend bothValues = unsafeAttribute $ Both (pure 
    { key: "transitionend", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transitionend", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTransitionend  (Effect Boolean)  where
  attr OnTransitionend value = unsafeAttribute $ This $ pure $
    { key: "transitionend", value: cb' (Cb (const value)) }
instance Attr anything OnTransitionend (Event.Event  (Effect Boolean) ) where
  attr OnTransitionend eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitionend", value: cb' (Cb (const value)) }

type OnTransitionendEffect =
  forall element
   . Attr element OnTransitionend (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTransitionend (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnTransitionend bothValues = unsafeAttribute $ Both (pure 
    { key: "transitionend", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "transitionend", value: unset' })
instance Attr everything OnTransitionend  Unit  where
  attr OnTransitionend _ = unsafeAttribute $ This $ pure $
    { key: "transitionend", value: unset' }
instance Attr everything OnTransitionend (Event.Event  Unit ) where
  attr OnTransitionend eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "transitionend", value: unset' }
