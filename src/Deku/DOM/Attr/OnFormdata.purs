module Deku.DOM.Attr.OnFormdata where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnFormdata = OnFormdata

instance Attr anything OnFormdata (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnFormdata bothValues = unsafeAttribute $ Both
    { key: "formdata", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "formdata", value: cb' value })
instance Attr anything OnFormdata  Cb  where
  attr OnFormdata value = unsafeAttribute $ This
    { key: "formdata", value: cb' value }
instance Attr anything OnFormdata (Event.Event  Cb ) where
  attr OnFormdata eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formdata", value: cb' value }

instance Attr anything OnFormdata (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnFormdata bothValues = unsafeAttribute $ Both
    { key: "formdata", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "formdata", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnFormdata  (Effect Unit)  where
  attr OnFormdata value = unsafeAttribute $ This
    { key: "formdata", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnFormdata (Event.Event  (Effect Unit) ) where
  attr OnFormdata eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formdata", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnFormdata (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnFormdata bothValues = unsafeAttribute $ Both
    { key: "formdata", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "formdata", value: cb' (Cb (const value)) }
    )
instance Attr anything OnFormdata  (Effect Boolean)  where
  attr OnFormdata value = unsafeAttribute $ This
    { key: "formdata", value: cb' (Cb (const value)) }
instance Attr anything OnFormdata (Event.Event  (Effect Boolean) ) where
  attr OnFormdata eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formdata", value: cb' (Cb (const value)) }

type OnFormdataEffect =
  forall element
   . Attr element OnFormdata (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnFormdata (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnFormdata bothValues = unsafeAttribute $ Both
    { key: "formdata", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "formdata", value: unset' })
instance Attr everything OnFormdata  Unit  where
  attr OnFormdata _ = unsafeAttribute $ This
    { key: "formdata", value: unset' }
instance Attr everything OnFormdata (Event.Event  Unit ) where
  attr OnFormdata eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "formdata", value: unset' }
