module Deku.DOM.Attr.OnPlaying where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPlaying = OnPlaying

instance Attr anything OnPlaying (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPlaying bothValues = unsafeAttribute $ Both
    { key: "playing", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "playing", value: cb' value })
instance Attr anything OnPlaying  Cb  where
  attr OnPlaying value = unsafeAttribute $ This $ pure $
    { key: "playing", value: cb' value }
instance Attr anything OnPlaying (Event.Event  Cb ) where
  attr OnPlaying eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "playing", value: cb' value }

instance Attr anything OnPlaying (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPlaying bothValues = unsafeAttribute $ Both
    { key: "playing", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "playing", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPlaying  (Effect Unit)  where
  attr OnPlaying value = unsafeAttribute $ This $ pure $
    { key: "playing", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPlaying (Event.Event  (Effect Unit) ) where
  attr OnPlaying eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "playing", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPlaying (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPlaying bothValues = unsafeAttribute $ Both
    { key: "playing", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "playing", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPlaying  (Effect Boolean)  where
  attr OnPlaying value = unsafeAttribute $ This $ pure $
    { key: "playing", value: cb' (Cb (const value)) }
instance Attr anything OnPlaying (Event.Event  (Effect Boolean) ) where
  attr OnPlaying eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "playing", value: cb' (Cb (const value)) }

type OnPlayingEffect =
  forall element
   . Attr element OnPlaying (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPlaying (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPlaying bothValues = unsafeAttribute $ Both
    { key: "playing", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "playing", value: unset' })
instance Attr everything OnPlaying  Unit  where
  attr OnPlaying _ = unsafeAttribute $ This $ pure $
    { key: "playing", value: unset' }
instance Attr everything OnPlaying (Event.Event  Unit ) where
  attr OnPlaying eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "playing", value: unset' }
