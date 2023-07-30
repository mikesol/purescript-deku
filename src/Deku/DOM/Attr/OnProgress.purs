module Deku.DOM.Attr.OnProgress where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnProgress = OnProgress

instance Attr anything OnProgress Cb where
  attr OnProgress bothValues = unsafeAttribute $ Both
    { key: "progress", value: cb' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "progress", value: cb' value })
  pureAttr OnProgress value = unsafeAttribute $ This
    { key: "progress", value: cb' value }
  unpureAttr OnProgress eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "progress", value: cb' value }

instance Attr anything OnProgress (Effect Unit) where
  attr OnProgress bothValues = unsafeAttribute $ Both
    { key: "progress", value: cb' (Cb (const ((fst bothValues) $> true))) }
    ( snd bothValues <#> \value ->
        { key: "progress", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnProgress value = unsafeAttribute $ This
    { key: "progress", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnProgress eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "progress", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnProgress (Effect Boolean) where
  attr OnProgress bothValues = unsafeAttribute $ Both
    { key: "progress", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "progress", value: cb' (Cb (const value)) }
    )
  pureAttr OnProgress value = unsafeAttribute $ This
    { key: "progress", value: cb' (Cb (const value)) }
  unpureAttr OnProgress eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "progress", value: cb' (Cb (const value)) }

type OnProgressEffect =
  forall element
   . Attr element OnProgress (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnProgress Unit where
  attr OnProgress bothValues = unsafeAttribute $ Both
    { key: "progress", value: unset' }
    (snd bothValues <#> \_ -> { key: "progress", value: unset' })
  pureAttr OnProgress _ = unsafeAttribute $ This
    { key: "progress", value: unset' }
  unpureAttr OnProgress eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "progress", value: unset' }
