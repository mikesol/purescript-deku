module Deku.DOM.Attr.OnDragleave where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnDragleave = OnDragleave

instance Attr anything OnDragleave Cb where
  attr OnDragleave bothValues = unsafeAttribute $ Both
    { key: "dragleave", value: cb' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "dragleave", value: cb' value })
  pureAttr OnDragleave value = unsafeAttribute $ This
    { key: "dragleave", value: cb' value }
  unpureAttr OnDragleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragleave", value: cb' value }

instance Attr anything OnDragleave (Effect Unit) where
  attr OnDragleave bothValues = unsafeAttribute $ Both
    { key: "dragleave", value: cb' (Cb (const ((fst bothValues) $> true))) }
    ( snd bothValues <#> \value ->
        { key: "dragleave", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnDragleave value = unsafeAttribute $ This
    { key: "dragleave", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnDragleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragleave", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragleave (Effect Boolean) where
  attr OnDragleave bothValues = unsafeAttribute $ Both
    { key: "dragleave", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "dragleave", value: cb' (Cb (const value)) }
    )
  pureAttr OnDragleave value = unsafeAttribute $ This
    { key: "dragleave", value: cb' (Cb (const value)) }
  unpureAttr OnDragleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragleave", value: cb' (Cb (const value)) }

type OnDragleaveEffect =
  forall element
   . Attr element OnDragleave (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDragleave Unit where
  attr OnDragleave bothValues = unsafeAttribute $ Both
    { key: "dragleave", value: unset' }
    (snd bothValues <#> \_ -> { key: "dragleave", value: unset' })
  pureAttr OnDragleave _ = unsafeAttribute $ This
    { key: "dragleave", value: unset' }
  unpureAttr OnDragleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "dragleave", value: unset' }
