module Deku.DOM.Attr.OnLostpointercapture where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnLostpointercapture = OnLostpointercapture

instance Attr anything OnLostpointercapture (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnLostpointercapture bothValues = unsafeAttribute $ Both (pure 
    { key: "lostpointercapture", value: cb' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "lostpointercapture", value: cb' value }
    )
instance Attr anything OnLostpointercapture  Cb  where
  attr OnLostpointercapture value = unsafeAttribute $ This $ pure $
    { key: "lostpointercapture", value: cb' value }
instance Attr anything OnLostpointercapture (Event.Event  Cb ) where
  attr OnLostpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "lostpointercapture", value: cb' value }

instance Attr anything OnLostpointercapture (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnLostpointercapture bothValues = unsafeAttribute $ Both (pure 
    { key: "lostpointercapture"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "lostpointercapture", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnLostpointercapture  (Effect Unit)  where
  attr OnLostpointercapture value = unsafeAttribute $ This $ pure $
    { key: "lostpointercapture", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLostpointercapture (Event.Event  (Effect Unit) ) where
  attr OnLostpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "lostpointercapture", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLostpointercapture (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnLostpointercapture bothValues = unsafeAttribute $ Both (pure 
    { key: "lostpointercapture", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "lostpointercapture", value: cb' (Cb (const value)) }
    )
instance Attr anything OnLostpointercapture  (Effect Boolean)  where
  attr OnLostpointercapture value = unsafeAttribute $ This $ pure $
    { key: "lostpointercapture", value: cb' (Cb (const value)) }
instance Attr anything OnLostpointercapture (Event.Event  (Effect Boolean) ) where
  attr OnLostpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "lostpointercapture", value: cb' (Cb (const value)) }

type OnLostpointercaptureEffect =
  forall element
   . Attr element OnLostpointercapture (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnLostpointercapture (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnLostpointercapture bothValues = unsafeAttribute $ Both (pure 
    { key: "lostpointercapture", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "lostpointercapture", value: unset' })
instance Attr everything OnLostpointercapture  Unit  where
  attr OnLostpointercapture _ = unsafeAttribute $ This $ pure $
    { key: "lostpointercapture", value: unset' }
instance Attr everything OnLostpointercapture (Event.Event  Unit ) where
  attr OnLostpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \_ -> { key: "lostpointercapture", value: unset' }
