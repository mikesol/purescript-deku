module Deku.DOM.Attr.OnLoadend where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnLoadend = OnLoadend

instance Attr anything OnLoadend (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnLoadend bothValues = unsafeAttribute $ Both
    { key: "loadend", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "loadend", value: cb' value })
instance Attr anything OnLoadend  Cb  where
  attr OnLoadend value = unsafeAttribute $ This
    { key: "loadend", value: cb' value }
instance Attr anything OnLoadend (Event.Event  Cb ) where
  attr OnLoadend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "loadend", value: cb' value }

instance Attr anything OnLoadend (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnLoadend bothValues = unsafeAttribute $ Both
    { key: "loadend", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "loadend", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnLoadend  (Effect Unit)  where
  attr OnLoadend value = unsafeAttribute $ This
    { key: "loadend", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLoadend (Event.Event  (Effect Unit) ) where
  attr OnLoadend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "loadend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoadend (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnLoadend bothValues = unsafeAttribute $ Both
    { key: "loadend", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "loadend", value: cb' (Cb (const value)) }
    )
instance Attr anything OnLoadend  (Effect Boolean)  where
  attr OnLoadend value = unsafeAttribute $ This
    { key: "loadend", value: cb' (Cb (const value)) }
instance Attr anything OnLoadend (Event.Event  (Effect Boolean) ) where
  attr OnLoadend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "loadend", value: cb' (Cb (const value)) }

type OnLoadendEffect =
  forall element
   . Attr element OnLoadend (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnLoadend (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnLoadend bothValues = unsafeAttribute $ Both
    { key: "loadend", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "loadend", value: unset' })
instance Attr everything OnLoadend  Unit  where
  attr OnLoadend _ = unsafeAttribute $ This
    { key: "loadend", value: unset' }
instance Attr everything OnLoadend (Event.Event  Unit ) where
  attr OnLoadend eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "loadend", value: unset' }
