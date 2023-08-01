module Deku.DOM.Attr.OnKeyup where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnKeyup = OnKeyup

instance Attr anything OnKeyup Cb where
  attr OnKeyup bothValues = unsafeAttribute $ Both
    { key: "keyup", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "keyup", value: cb' value })
  pureAttr OnKeyup value = unsafeAttribute $ This
    { key: "keyup", value: cb' value }
  unpureAttr OnKeyup eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keyup", value: cb' value }

instance Attr anything OnKeyup (Effect Unit) where
  attr OnKeyup bothValues = unsafeAttribute $ Both
    { key: "keyup", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "keyup", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnKeyup value = unsafeAttribute $ This
    { key: "keyup", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnKeyup eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keyup", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnKeyup (Effect Boolean) where
  attr OnKeyup bothValues = unsafeAttribute $ Both
    { key: "keyup", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "keyup", value: cb' (Cb (const value)) }
    )
  pureAttr OnKeyup value = unsafeAttribute $ This
    { key: "keyup", value: cb' (Cb (const value)) }
  unpureAttr OnKeyup eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keyup", value: cb' (Cb (const value)) }

type OnKeyupEffect =
  forall element
   . Attr element OnKeyup (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnKeyup Unit where
  attr OnKeyup bothValues = unsafeAttribute $ Both
    { key: "keyup", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "keyup", value: unset' })
  pureAttr OnKeyup _ = unsafeAttribute $ This { key: "keyup", value: unset' }
  unpureAttr OnKeyup eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "keyup", value: unset' }
