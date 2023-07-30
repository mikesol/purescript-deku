module Deku.DOM.Attr.OnAnimationstart where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnAnimationstart = OnAnimationstart

instance Attr anything OnAnimationstart Cb where
  attr OnAnimationstart bothValues = unsafeAttribute $ Both
    { key: "animationstart", value: cb' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "animationstart", value: cb' value })
  pureAttr OnAnimationstart value = unsafeAttribute $ This
    { key: "animationstart", value: cb' value }
  unpureAttr OnAnimationstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "animationstart", value: cb' value }

instance Attr anything OnAnimationstart (Effect Unit) where
  attr OnAnimationstart bothValues = unsafeAttribute $ Both
    { key: "animationstart"
    , value: cb' (Cb (const ((fst bothValues) $> true)))
    }
    ( snd bothValues <#> \value ->
        { key: "animationstart", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnAnimationstart value = unsafeAttribute $ This
    { key: "animationstart", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnAnimationstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "animationstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationstart (Effect Boolean) where
  attr OnAnimationstart bothValues = unsafeAttribute $ Both
    { key: "animationstart", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "animationstart", value: cb' (Cb (const value)) }
    )
  pureAttr OnAnimationstart value = unsafeAttribute $ This
    { key: "animationstart", value: cb' (Cb (const value)) }
  unpureAttr OnAnimationstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "animationstart", value: cb' (Cb (const value)) }

type OnAnimationstartEffect =
  forall element
   . Attr element OnAnimationstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAnimationstart Unit where
  attr OnAnimationstart bothValues = unsafeAttribute $ Both
    { key: "animationstart", value: unset' }
    (snd bothValues <#> \_ -> { key: "animationstart", value: unset' })
  pureAttr OnAnimationstart _ = unsafeAttribute $ This
    { key: "animationstart", value: unset' }
  unpureAttr OnAnimationstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "animationstart", value: unset' }
