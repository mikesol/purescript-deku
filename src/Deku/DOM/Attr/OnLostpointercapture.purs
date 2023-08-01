module Deku.DOM.Attr.OnLostpointercapture where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnLostpointercapture = OnLostpointercapture

instance Attr anything OnLostpointercapture Cb where
  attr OnLostpointercapture bothValues = unsafeAttribute $ Both
    { key: "lostpointercapture", value: cb' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "lostpointercapture", value: cb' value }
    )
  pureAttr OnLostpointercapture value = unsafeAttribute $ This
    { key: "lostpointercapture", value: cb' value }
  unpureAttr OnLostpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "lostpointercapture", value: cb' value }

instance Attr anything OnLostpointercapture (Effect Unit) where
  attr OnLostpointercapture bothValues = unsafeAttribute $ Both
    { key: "lostpointercapture"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "lostpointercapture", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnLostpointercapture value = unsafeAttribute $ This
    { key: "lostpointercapture", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnLostpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "lostpointercapture", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLostpointercapture (Effect Boolean) where
  attr OnLostpointercapture bothValues = unsafeAttribute $ Both
    { key: "lostpointercapture", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "lostpointercapture", value: cb' (Cb (const value)) }
    )
  pureAttr OnLostpointercapture value = unsafeAttribute $ This
    { key: "lostpointercapture", value: cb' (Cb (const value)) }
  unpureAttr OnLostpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "lostpointercapture", value: cb' (Cb (const value)) }

type OnLostpointercaptureEffect =
  forall element
   . Attr element OnLostpointercapture (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnLostpointercapture Unit where
  attr OnLostpointercapture bothValues = unsafeAttribute $ Both
    { key: "lostpointercapture", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "lostpointercapture", value: unset' })
  pureAttr OnLostpointercapture _ = unsafeAttribute $ This
    { key: "lostpointercapture", value: unset' }
  unpureAttr OnLostpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \_ -> { key: "lostpointercapture", value: unset' }
