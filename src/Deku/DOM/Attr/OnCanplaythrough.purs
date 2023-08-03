module Deku.DOM.Attr.OnCanplaythrough where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnCanplaythrough = OnCanplaythrough

instance Attr anything OnCanplaythrough (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnCanplaythrough bothValues = unsafeAttribute $ Both
    { key: "canplaythrough", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "canplaythrough", value: cb' value })
instance Attr anything OnCanplaythrough  Cb  where
  attr OnCanplaythrough value = unsafeAttribute $ This $ pure $
    { key: "canplaythrough", value: cb' value }
instance Attr anything OnCanplaythrough (Event.Event  Cb ) where
  attr OnCanplaythrough eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "canplaythrough", value: cb' value }

instance Attr anything OnCanplaythrough (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnCanplaythrough bothValues = unsafeAttribute $ Both
    { key: "canplaythrough"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "canplaythrough", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnCanplaythrough  (Effect Unit)  where
  attr OnCanplaythrough value = unsafeAttribute $ This $ pure $
    { key: "canplaythrough", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnCanplaythrough (Event.Event  (Effect Unit) ) where
  attr OnCanplaythrough eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "canplaythrough", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnCanplaythrough (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnCanplaythrough bothValues = unsafeAttribute $ Both
    { key: "canplaythrough", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "canplaythrough", value: cb' (Cb (const value)) }
    )
instance Attr anything OnCanplaythrough  (Effect Boolean)  where
  attr OnCanplaythrough value = unsafeAttribute $ This $ pure $
    { key: "canplaythrough", value: cb' (Cb (const value)) }
instance Attr anything OnCanplaythrough (Event.Event  (Effect Boolean) ) where
  attr OnCanplaythrough eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "canplaythrough", value: cb' (Cb (const value)) }

type OnCanplaythroughEffect =
  forall element
   . Attr element OnCanplaythrough (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnCanplaythrough (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnCanplaythrough bothValues = unsafeAttribute $ Both
    { key: "canplaythrough", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "canplaythrough", value: unset' })
instance Attr everything OnCanplaythrough  Unit  where
  attr OnCanplaythrough _ = unsafeAttribute $ This $ pure $
    { key: "canplaythrough", value: unset' }
instance Attr everything OnCanplaythrough (Event.Event  Unit ) where
  attr OnCanplaythrough eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "canplaythrough", value: unset' }
