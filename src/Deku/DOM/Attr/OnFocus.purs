module Deku.DOM.Attr.OnFocus where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnFocus = OnFocus

instance Attr anything OnFocus Cb where
  attr OnFocus bothValues = unsafeAttribute $ Both
    { key: "focus", value: cb' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "focus", value: cb' value })
  pureAttr OnFocus value = unsafeAttribute $ This
    { key: "focus", value: cb' value }
  unpureAttr OnFocus eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "focus", value: cb' value }

instance Attr anything OnFocus (Effect Unit) where
  attr OnFocus bothValues = unsafeAttribute $ Both
    { key: "focus", value: cb' (Cb (const ((fst bothValues) $> true))) }
    ( snd bothValues <#> \value ->
        { key: "focus", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnFocus value = unsafeAttribute $ This
    { key: "focus", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnFocus eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "focus", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnFocus (Effect Boolean) where
  attr OnFocus bothValues = unsafeAttribute $ Both
    { key: "focus", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "focus", value: cb' (Cb (const value)) }
    )
  pureAttr OnFocus value = unsafeAttribute $ This
    { key: "focus", value: cb' (Cb (const value)) }
  unpureAttr OnFocus eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "focus", value: cb' (Cb (const value)) }

type OnFocusEffect =
  forall element
   . Attr element OnFocus (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnFocus Unit where
  attr OnFocus bothValues = unsafeAttribute $ Both
    { key: "focus", value: unset' }
    (snd bothValues <#> \_ -> { key: "focus", value: unset' })
  pureAttr OnFocus _ = unsafeAttribute $ This { key: "focus", value: unset' }
  unpureAttr OnFocus eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "focus", value: unset' }
