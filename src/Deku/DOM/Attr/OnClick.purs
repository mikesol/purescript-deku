module Deku.DOM.Attr.OnClick where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnClick = OnClick

instance Attr anything OnClick Cb where
  attr OnClick bothValues = unsafeAttribute $ Both
    { key: "click", value: cb' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "click", value: cb' value })
  pureAttr OnClick value = unsafeAttribute $ This
    { key: "click", value: cb' value }
  unpureAttr OnClick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "click", value: cb' value }

instance Attr anything OnClick (Effect Unit) where
  attr OnClick bothValues = unsafeAttribute $ Both
    { key: "click", value: cb' (Cb (const ((fst bothValues) $> true))) }
    ( snd bothValues <#> \value ->
        { key: "click", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnClick value = unsafeAttribute $ This
    { key: "click", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnClick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "click", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnClick (Effect Boolean) where
  attr OnClick bothValues = unsafeAttribute $ Both
    { key: "click", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "click", value: cb' (Cb (const value)) }
    )
  pureAttr OnClick value = unsafeAttribute $ This
    { key: "click", value: cb' (Cb (const value)) }
  unpureAttr OnClick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "click", value: cb' (Cb (const value)) }

type OnClickEffect =
  forall element
   . Attr element OnClick (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnClick Unit where
  attr OnClick bothValues = unsafeAttribute $ Both
    { key: "click", value: unset' }
    (snd bothValues <#> \_ -> { key: "click", value: unset' })
  pureAttr OnClick _ = unsafeAttribute $ This { key: "click", value: unset' }
  unpureAttr OnClick eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "click", value: unset' }
