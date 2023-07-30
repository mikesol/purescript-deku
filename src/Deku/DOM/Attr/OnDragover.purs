module Deku.DOM.Attr.OnDragover where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnDragover = OnDragover

instance Attr anything OnDragover Cb where
  attr OnDragover bothValues = unsafeAttribute $ Both
    { key: "dragover", value: cb' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "dragover", value: cb' value })
  pureAttr OnDragover value = unsafeAttribute $ This
    { key: "dragover", value: cb' value }
  unpureAttr OnDragover eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragover", value: cb' value }

instance Attr anything OnDragover (Effect Unit) where
  attr OnDragover bothValues = unsafeAttribute $ Both
    { key: "dragover", value: cb' (Cb (const ((fst bothValues) $> true))) }
    ( snd bothValues <#> \value ->
        { key: "dragover", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnDragover value = unsafeAttribute $ This
    { key: "dragover", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnDragover eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragover", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragover (Effect Boolean) where
  attr OnDragover bothValues = unsafeAttribute $ Both
    { key: "dragover", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "dragover", value: cb' (Cb (const value)) }
    )
  pureAttr OnDragover value = unsafeAttribute $ This
    { key: "dragover", value: cb' (Cb (const value)) }
  unpureAttr OnDragover eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragover", value: cb' (Cb (const value)) }

type OnDragoverEffect =
  forall element
   . Attr element OnDragover (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDragover Unit where
  attr OnDragover bothValues = unsafeAttribute $ Both
    { key: "dragover", value: unset' }
    (snd bothValues <#> \_ -> { key: "dragover", value: unset' })
  pureAttr OnDragover _ = unsafeAttribute $ This
    { key: "dragover", value: unset' }
  unpureAttr OnDragover eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "dragover", value: unset' }
