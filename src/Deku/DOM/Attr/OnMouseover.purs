module Deku.DOM.Attr.OnMouseover where

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

data OnMouseover = OnMouseover

instance Attr anything OnMouseover (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnMouseover bothValues = unsafeAttribute $ Both (pure 
    { key: "mouseover", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mouseover", value: cb' value })
instance Attr anything OnMouseover (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnMouseover (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "mouseover", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mouseover", value: cb' value })
instance Attr anything OnMouseover  Cb  where
  attr OnMouseover value = unsafeAttribute $ This $ pure $
    { key: "mouseover", value: cb' value }
instance Attr anything OnMouseover (Event.Event  Cb ) where
  attr OnMouseover eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseover", value: cb' value }

instance Attr anything OnMouseover (ST.ST Global.Global  Cb ) where
  attr OnMouseover iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "mouseover", value: cb' value }

instance Attr anything OnMouseover (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnMouseover bothValues = unsafeAttribute $ Both (pure 
    { key: "mouseover", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mouseover", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMouseover (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnMouseover (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "mouseover", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "mouseover", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMouseover  (Effect Unit)  where
  attr OnMouseover value = unsafeAttribute $ This $ pure $
    { key: "mouseover", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMouseover (Event.Event  (Effect Unit) ) where
  attr OnMouseover eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseover", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseover (ST.ST Global.Global  (Effect Unit) ) where
  attr OnMouseover iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "mouseover", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseover (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnMouseover bothValues = unsafeAttribute $ Both (pure 
    { key: "mouseover", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mouseover", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMouseover (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnMouseover (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "mouseover", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "mouseover", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMouseover  (Effect Boolean)  where
  attr OnMouseover value = unsafeAttribute $ This $ pure $
    { key: "mouseover", value: cb' (Cb (const value)) }
instance Attr anything OnMouseover (Event.Event  (Effect Boolean) ) where
  attr OnMouseover eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseover", value: cb' (Cb (const value)) }

instance Attr anything OnMouseover (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnMouseover iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "mouseover", value: cb' (Cb (const value)) }

instance Attr everything OnMouseover (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnMouseover bothValues = unsafeAttribute $ Both (pure 
    { key: "mouseover", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "mouseover", value: unset' })
instance Attr everything OnMouseover (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnMouseover (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "mouseover", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "mouseover", value: unset' })
instance Attr everything OnMouseover  Unit  where
  attr OnMouseover _ = unsafeAttribute $ This $ pure $
    { key: "mouseover", value: unset' }
instance Attr everything OnMouseover (Event.Event  Unit ) where
  attr OnMouseover eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "mouseover", value: unset' }

instance Attr everything OnMouseover (ST.ST Global.Global  Unit ) where
  attr OnMouseover iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "mouseover", value: unset' }
