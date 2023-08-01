module Deku.DOM.Attr.OnContextmenu where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnContextmenu = OnContextmenu

instance Attr anything OnContextmenu Cb where
  attr OnContextmenu bothValues = unsafeAttribute $ Both
    { key: "contextmenu", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: cb' value })
  pureAttr OnContextmenu value = unsafeAttribute $ This
    { key: "contextmenu", value: cb' value }
  unpureAttr OnContextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: cb' value }

instance Attr anything OnContextmenu (Effect Unit) where
  attr OnContextmenu bothValues = unsafeAttribute $ Both
    { key: "contextmenu", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contextmenu", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnContextmenu value = unsafeAttribute $ This
    { key: "contextmenu", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnContextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnContextmenu (Effect Boolean) where
  attr OnContextmenu bothValues = unsafeAttribute $ Both
    { key: "contextmenu", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contextmenu", value: cb' (Cb (const value)) }
    )
  pureAttr OnContextmenu value = unsafeAttribute $ This
    { key: "contextmenu", value: cb' (Cb (const value)) }
  unpureAttr OnContextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: cb' (Cb (const value)) }

type OnContextmenuEffect =
  forall element
   . Attr element OnContextmenu (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnContextmenu Unit where
  attr OnContextmenu bothValues = unsafeAttribute $ Both
    { key: "contextmenu", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "contextmenu", value: unset' })
  pureAttr OnContextmenu _ = unsafeAttribute $ This
    { key: "contextmenu", value: unset' }
  unpureAttr OnContextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "contextmenu", value: unset' }
