module Deku.DOM.Attr.OnMouseenter where

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

data OnMouseenter = OnMouseenter

instance Attr anything OnMouseenter (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnMouseenter bothValues = unsafeAttribute $ Both (pure 
    { key: "mouseenter", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mouseenter", value: cb' value })
instance Attr anything OnMouseenter (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnMouseenter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mouseenter", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mouseenter", value: cb' value })
instance Attr anything OnMouseenter  Cb  where
  attr OnMouseenter value = unsafeAttribute $ This $ pure $
    { key: "mouseenter", value: cb' value }
instance Attr anything OnMouseenter (Event.Event  Cb ) where
  attr OnMouseenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseenter", value: cb' value }

instance Attr anything OnMouseenter (ST.ST Global.Global  Cb ) where
  attr OnMouseenter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "mouseenter", value: cb' value }

instance Attr anything OnMouseenter (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnMouseenter bothValues = unsafeAttribute $ Both (pure 
    { key: "mouseenter", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mouseenter", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMouseenter (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnMouseenter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mouseenter", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "mouseenter", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMouseenter  (Effect Unit)  where
  attr OnMouseenter value = unsafeAttribute $ This $ pure $
    { key: "mouseenter", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMouseenter (Event.Event  (Effect Unit) ) where
  attr OnMouseenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseenter", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseenter (ST.ST Global.Global  (Effect Unit) ) where
  attr OnMouseenter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "mouseenter", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseenter (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnMouseenter bothValues = unsafeAttribute $ Both (pure 
    { key: "mouseenter", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mouseenter", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMouseenter (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnMouseenter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mouseenter", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "mouseenter", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMouseenter  (Effect Boolean)  where
  attr OnMouseenter value = unsafeAttribute $ This $ pure $
    { key: "mouseenter", value: cb' (Cb (const value)) }
instance Attr anything OnMouseenter (Event.Event  (Effect Boolean) ) where
  attr OnMouseenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseenter", value: cb' (Cb (const value)) }

instance Attr anything OnMouseenter (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnMouseenter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "mouseenter", value: cb' (Cb (const value)) }

instance Attr everything OnMouseenter (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnMouseenter bothValues = unsafeAttribute $ Both (pure 
    { key: "mouseenter", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "mouseenter", value: unset' })
instance Attr everything OnMouseenter (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnMouseenter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "mouseenter", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "mouseenter", value: unset' })
instance Attr everything OnMouseenter  Unit  where
  attr OnMouseenter _ = unsafeAttribute $ This $ pure $
    { key: "mouseenter", value: unset' }
instance Attr everything OnMouseenter (Event.Event  Unit ) where
  attr OnMouseenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "mouseenter", value: unset' }

instance Attr everything OnMouseenter (ST.ST Global.Global  Unit ) where
  attr OnMouseenter stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "mouseenter", value: unset' }
