module Deku.DOM.Attr.OnClose where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnClose = OnClose

instance Attr anything OnClose Cb where
  attr OnClose bothValues = unsafeAttribute $ Both
    { key: "close", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "close", value: cb' value })
  pureAttr OnClose value = unsafeAttribute $ This
    { key: "close", value: cb' value }
  unpureAttr OnClose eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "close", value: cb' value }

instance Attr anything OnClose (Effect Unit) where
  attr OnClose bothValues = unsafeAttribute $ Both
    { key: "close", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "close", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnClose value = unsafeAttribute $ This
    { key: "close", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnClose eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "close", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnClose (Effect Boolean) where
  attr OnClose bothValues = unsafeAttribute $ Both
    { key: "close", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "close", value: cb' (Cb (const value)) }
    )
  pureAttr OnClose value = unsafeAttribute $ This
    { key: "close", value: cb' (Cb (const value)) }
  unpureAttr OnClose eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "close", value: cb' (Cb (const value)) }

type OnCloseEffect =
  forall element
   . Attr element OnClose (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnClose Unit where
  attr OnClose bothValues = unsafeAttribute $ Both
    { key: "close", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "close", value: unset' })
  pureAttr OnClose _ = unsafeAttribute $ This { key: "close", value: unset' }
  unpureAttr OnClose eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "close", value: unset' }
