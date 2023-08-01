module Deku.DOM.Attr.OnCanplay where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnCanplay = OnCanplay

instance Attr anything OnCanplay Cb where
  attr OnCanplay bothValues = unsafeAttribute $ Both
    { key: "canplay", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "canplay", value: cb' value })
  pureAttr OnCanplay value = unsafeAttribute $ This
    { key: "canplay", value: cb' value }
  unpureAttr OnCanplay eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "canplay", value: cb' value }

instance Attr anything OnCanplay (Effect Unit) where
  attr OnCanplay bothValues = unsafeAttribute $ Both
    { key: "canplay", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "canplay", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnCanplay value = unsafeAttribute $ This
    { key: "canplay", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnCanplay eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "canplay", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnCanplay (Effect Boolean) where
  attr OnCanplay bothValues = unsafeAttribute $ Both
    { key: "canplay", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "canplay", value: cb' (Cb (const value)) }
    )
  pureAttr OnCanplay value = unsafeAttribute $ This
    { key: "canplay", value: cb' (Cb (const value)) }
  unpureAttr OnCanplay eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "canplay", value: cb' (Cb (const value)) }

type OnCanplayEffect =
  forall element
   . Attr element OnCanplay (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnCanplay Unit where
  attr OnCanplay bothValues = unsafeAttribute $ Both
    { key: "canplay", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "canplay", value: unset' })
  pureAttr OnCanplay _ = unsafeAttribute $ This
    { key: "canplay", value: unset' }
  unpureAttr OnCanplay eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "canplay", value: unset' }
