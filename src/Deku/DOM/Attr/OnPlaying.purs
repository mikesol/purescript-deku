module Deku.DOM.Attr.OnPlaying where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPlaying = OnPlaying

instance Attr anything OnPlaying Cb where
  attr OnPlaying bothValues = unsafeAttribute $ Both
    { key: "playing", value: cb' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "playing", value: cb' value })
  pureAttr OnPlaying value = unsafeAttribute $ This
    { key: "playing", value: cb' value }
  unpureAttr OnPlaying eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "playing", value: cb' value }

instance Attr anything OnPlaying (Effect Unit) where
  attr OnPlaying bothValues = unsafeAttribute $ Both
    { key: "playing", value: cb' (Cb (const ((fst bothValues) $> true))) }
    ( snd bothValues <#> \value ->
        { key: "playing", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnPlaying value = unsafeAttribute $ This
    { key: "playing", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnPlaying eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "playing", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPlaying (Effect Boolean) where
  attr OnPlaying bothValues = unsafeAttribute $ Both
    { key: "playing", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "playing", value: cb' (Cb (const value)) }
    )
  pureAttr OnPlaying value = unsafeAttribute $ This
    { key: "playing", value: cb' (Cb (const value)) }
  unpureAttr OnPlaying eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "playing", value: cb' (Cb (const value)) }

type OnPlayingEffect =
  forall element
   . Attr element OnPlaying (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPlaying Unit where
  attr OnPlaying bothValues = unsafeAttribute $ Both
    { key: "playing", value: unset' }
    (snd bothValues <#> \_ -> { key: "playing", value: unset' })
  pureAttr OnPlaying _ = unsafeAttribute $ This
    { key: "playing", value: unset' }
  unpureAttr OnPlaying eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "playing", value: unset' }
