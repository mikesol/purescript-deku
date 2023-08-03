module Deku.DOM.Attr.OnKeyup where

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

data OnKeyup = OnKeyup

instance Attr anything OnKeyup (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnKeyup bothValues = unsafeAttribute $ Both (pure 
    { key: "keyup", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keyup", value: cb' value })
instance Attr anything OnKeyup (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnKeyup (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keyup", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keyup", value: cb' value })
instance Attr anything OnKeyup  Cb  where
  attr OnKeyup value = unsafeAttribute $ This $ pure $
    { key: "keyup", value: cb' value }
instance Attr anything OnKeyup (Event.Event  Cb ) where
  attr OnKeyup eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keyup", value: cb' value }

instance Attr anything OnKeyup (ST.ST Global.Global  Cb ) where
  attr OnKeyup stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keyup", value: cb' value }

instance Attr anything OnKeyup (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnKeyup bothValues = unsafeAttribute $ Both (pure 
    { key: "keyup", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "keyup", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnKeyup (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnKeyup (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keyup", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "keyup", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnKeyup  (Effect Unit)  where
  attr OnKeyup value = unsafeAttribute $ This $ pure $
    { key: "keyup", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnKeyup (Event.Event  (Effect Unit) ) where
  attr OnKeyup eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keyup", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnKeyup (ST.ST Global.Global  (Effect Unit) ) where
  attr OnKeyup stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keyup", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnKeyup (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnKeyup bothValues = unsafeAttribute $ Both (pure 
    { key: "keyup", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "keyup", value: cb' (Cb (const value)) }
    )
instance Attr anything OnKeyup (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnKeyup (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keyup", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "keyup", value: cb' (Cb (const value)) }
    )
instance Attr anything OnKeyup  (Effect Boolean)  where
  attr OnKeyup value = unsafeAttribute $ This $ pure $
    { key: "keyup", value: cb' (Cb (const value)) }
instance Attr anything OnKeyup (Event.Event  (Effect Boolean) ) where
  attr OnKeyup eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keyup", value: cb' (Cb (const value)) }

instance Attr anything OnKeyup (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnKeyup stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keyup", value: cb' (Cb (const value)) }

instance Attr everything OnKeyup (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnKeyup bothValues = unsafeAttribute $ Both (pure 
    { key: "keyup", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "keyup", value: unset' })
instance Attr everything OnKeyup (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnKeyup (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "keyup", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "keyup", value: unset' })
instance Attr everything OnKeyup  Unit  where
  attr OnKeyup _ = unsafeAttribute $ This $ pure $ { key: "keyup", value: unset' }
instance Attr everything OnKeyup (Event.Event  Unit ) where
  attr OnKeyup eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "keyup", value: unset' }

instance Attr everything OnKeyup (ST.ST Global.Global  Unit ) where
  attr OnKeyup stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "keyup", value: unset' }
