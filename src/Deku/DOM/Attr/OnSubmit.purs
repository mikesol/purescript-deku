module Deku.DOM.Attr.OnSubmit where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSubmit = OnSubmit

instance Attr anything OnSubmit Cb where
  attr OnSubmit bothValues = unsafeAttribute $ Both
    { key: "submit", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "submit", value: cb' value })
  pureAttr OnSubmit value = unsafeAttribute $ This
    { key: "submit", value: cb' value }
  unpureAttr OnSubmit eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "submit", value: cb' value }

instance Attr anything OnSubmit (Effect Unit) where
  attr OnSubmit bothValues = unsafeAttribute $ Both
    { key: "submit", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "submit", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnSubmit value = unsafeAttribute $ This
    { key: "submit", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnSubmit eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "submit", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSubmit (Effect Boolean) where
  attr OnSubmit bothValues = unsafeAttribute $ Both
    { key: "submit", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "submit", value: cb' (Cb (const value)) }
    )
  pureAttr OnSubmit value = unsafeAttribute $ This
    { key: "submit", value: cb' (Cb (const value)) }
  unpureAttr OnSubmit eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "submit", value: cb' (Cb (const value)) }

type OnSubmitEffect =
  forall element
   . Attr element OnSubmit (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSubmit Unit where
  attr OnSubmit bothValues = unsafeAttribute $ Both
    { key: "submit", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "submit", value: unset' })
  pureAttr OnSubmit _ = unsafeAttribute $ This { key: "submit", value: unset' }
  unpureAttr OnSubmit eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "submit", value: unset' }
