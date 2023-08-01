module Deku.DOM.Attr.OnFormdata where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnFormdata = OnFormdata

instance Attr anything OnFormdata Cb where
  attr OnFormdata bothValues = unsafeAttribute $ Both
    { key: "formdata", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "formdata", value: cb' value })
  pureAttr OnFormdata value = unsafeAttribute $ This
    { key: "formdata", value: cb' value }
  unpureAttr OnFormdata eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formdata", value: cb' value }

instance Attr anything OnFormdata (Effect Unit) where
  attr OnFormdata bothValues = unsafeAttribute $ Both
    { key: "formdata", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "formdata", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnFormdata value = unsafeAttribute $ This
    { key: "formdata", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnFormdata eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formdata", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnFormdata (Effect Boolean) where
  attr OnFormdata bothValues = unsafeAttribute $ Both
    { key: "formdata", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "formdata", value: cb' (Cb (const value)) }
    )
  pureAttr OnFormdata value = unsafeAttribute $ This
    { key: "formdata", value: cb' (Cb (const value)) }
  unpureAttr OnFormdata eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formdata", value: cb' (Cb (const value)) }

type OnFormdataEffect =
  forall element
   . Attr element OnFormdata (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnFormdata Unit where
  attr OnFormdata bothValues = unsafeAttribute $ Both
    { key: "formdata", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "formdata", value: unset' })
  pureAttr OnFormdata _ = unsafeAttribute $ This
    { key: "formdata", value: unset' }
  unpureAttr OnFormdata eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "formdata", value: unset' }
