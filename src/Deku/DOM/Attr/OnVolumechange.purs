module Deku.DOM.Attr.OnVolumechange where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnVolumechange = OnVolumechange

instance Attr anything OnVolumechange Cb where
  attr OnVolumechange bothValues = unsafeAttribute $ Both
    { key: "volumechange", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "volumechange", value: cb' value })
  pureAttr OnVolumechange value = unsafeAttribute $ This
    { key: "volumechange", value: cb' value }
  unpureAttr OnVolumechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "volumechange", value: cb' value }

instance Attr anything OnVolumechange (Effect Unit) where
  attr OnVolumechange bothValues = unsafeAttribute $ Both
    { key: "volumechange", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "volumechange", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnVolumechange value = unsafeAttribute $ This
    { key: "volumechange", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnVolumechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "volumechange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnVolumechange (Effect Boolean) where
  attr OnVolumechange bothValues = unsafeAttribute $ Both
    { key: "volumechange", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "volumechange", value: cb' (Cb (const value)) }
    )
  pureAttr OnVolumechange value = unsafeAttribute $ This
    { key: "volumechange", value: cb' (Cb (const value)) }
  unpureAttr OnVolumechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "volumechange", value: cb' (Cb (const value)) }

type OnVolumechangeEffect =
  forall element
   . Attr element OnVolumechange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnVolumechange Unit where
  attr OnVolumechange bothValues = unsafeAttribute $ Both
    { key: "volumechange", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "volumechange", value: unset' })
  pureAttr OnVolumechange _ = unsafeAttribute $ This
    { key: "volumechange", value: unset' }
  unpureAttr OnVolumechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "volumechange", value: unset' }
