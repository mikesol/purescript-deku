module Deku.DOM.Attr.OnVolumechange where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnVolumechange = OnVolumechange

instance Attr anything OnVolumechange (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnVolumechange bothValues = unsafeAttribute $ Both (pure 
    { key: "volumechange", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "volumechange", value: cb' value })
instance Attr anything OnVolumechange  Cb  where
  attr OnVolumechange value = unsafeAttribute $ This $ pure $
    { key: "volumechange", value: cb' value }
instance Attr anything OnVolumechange (Event.Event  Cb ) where
  attr OnVolumechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "volumechange", value: cb' value }

instance Attr anything OnVolumechange (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnVolumechange bothValues = unsafeAttribute $ Both (pure 
    { key: "volumechange", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "volumechange", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnVolumechange  (Effect Unit)  where
  attr OnVolumechange value = unsafeAttribute $ This $ pure $
    { key: "volumechange", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnVolumechange (Event.Event  (Effect Unit) ) where
  attr OnVolumechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "volumechange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnVolumechange (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnVolumechange bothValues = unsafeAttribute $ Both (pure 
    { key: "volumechange", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "volumechange", value: cb' (Cb (const value)) }
    )
instance Attr anything OnVolumechange  (Effect Boolean)  where
  attr OnVolumechange value = unsafeAttribute $ This $ pure $
    { key: "volumechange", value: cb' (Cb (const value)) }
instance Attr anything OnVolumechange (Event.Event  (Effect Boolean) ) where
  attr OnVolumechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "volumechange", value: cb' (Cb (const value)) }

type OnVolumechangeEffect =
  forall element
   . Attr element OnVolumechange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnVolumechange (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnVolumechange bothValues = unsafeAttribute $ Both (pure 
    { key: "volumechange", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "volumechange", value: unset' })
instance Attr everything OnVolumechange  Unit  where
  attr OnVolumechange _ = unsafeAttribute $ This $ pure $
    { key: "volumechange", value: unset' }
instance Attr everything OnVolumechange (Event.Event  Unit ) where
  attr OnVolumechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "volumechange", value: unset' }
