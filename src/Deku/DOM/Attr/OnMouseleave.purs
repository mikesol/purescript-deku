module Deku.DOM.Attr.OnMouseleave where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnMouseleave = OnMouseleave

instance Attr anything OnMouseleave (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnMouseleave bothValues = unsafeAttribute $ Both (pure 
    { key: "mouseleave", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mouseleave", value: cb' value })
instance Attr anything OnMouseleave (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnMouseleave (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mouseleave", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mouseleave", value: cb' value })
instance Attr anything OnMouseleave  Cb  where
  attr OnMouseleave value = unsafeAttribute $ This $ pure $
    { key: "mouseleave", value: cb' value }
instance Attr anything OnMouseleave (Event.Event  Cb ) where
  attr OnMouseleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseleave", value: cb' value }

instance Attr anything OnMouseleave (ST.ST Global.Global  Cb ) where
  attr OnMouseleave stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "mouseleave", value: cb' value }

instance Attr anything OnMouseleave (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnMouseleave bothValues = unsafeAttribute $ Both (pure 
    { key: "mouseleave", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mouseleave", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMouseleave (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnMouseleave (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mouseleave", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "mouseleave", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMouseleave  (Effect Unit)  where
  attr OnMouseleave value = unsafeAttribute $ This $ pure $
    { key: "mouseleave", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMouseleave (Event.Event  (Effect Unit) ) where
  attr OnMouseleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseleave", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseleave (ST.ST Global.Global  (Effect Unit) ) where
  attr OnMouseleave stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "mouseleave", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseleave (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnMouseleave bothValues = unsafeAttribute $ Both (pure 
    { key: "mouseleave", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mouseleave", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMouseleave (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnMouseleave (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mouseleave", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "mouseleave", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMouseleave  (Effect Boolean)  where
  attr OnMouseleave value = unsafeAttribute $ This $ pure $
    { key: "mouseleave", value: cb' (Cb (const value)) }
instance Attr anything OnMouseleave (Event.Event  (Effect Boolean) ) where
  attr OnMouseleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseleave", value: cb' (Cb (const value)) }

instance Attr anything OnMouseleave (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnMouseleave stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "mouseleave", value: cb' (Cb (const value)) }

instance Attr everything OnMouseleave (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnMouseleave bothValues = unsafeAttribute $ Both (pure 
    { key: "mouseleave", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "mouseleave", value: unset' })
instance Attr everything OnMouseleave (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnMouseleave (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "mouseleave", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "mouseleave", value: unset' })
instance Attr everything OnMouseleave  Unit  where
  attr OnMouseleave _ = unsafeAttribute $ This $ pure $
    { key: "mouseleave", value: unset' }
instance Attr everything OnMouseleave (Event.Event  Unit ) where
  attr OnMouseleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "mouseleave", value: unset' }

instance Attr everything OnMouseleave (ST.ST Global.Global  Unit ) where
  attr OnMouseleave stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "mouseleave", value: unset' }
