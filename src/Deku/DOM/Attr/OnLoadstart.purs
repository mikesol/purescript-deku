module Deku.DOM.Attr.OnLoadstart where

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

data OnLoadstart = OnLoadstart

instance Attr anything OnLoadstart (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnLoadstart bothValues = unsafeAttribute $ Both (pure 
    { key: "loadstart", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "loadstart", value: cb' value })
instance Attr anything OnLoadstart (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnLoadstart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "loadstart", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "loadstart", value: cb' value })
instance Attr anything OnLoadstart  Cb  where
  attr OnLoadstart value = unsafeAttribute $ This $ pure $
    { key: "loadstart", value: cb' value }
instance Attr anything OnLoadstart (Event.Event  Cb ) where
  attr OnLoadstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "loadstart", value: cb' value }

instance Attr anything OnLoadstart (ST.ST Global.Global  Cb ) where
  attr OnLoadstart stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "loadstart", value: cb' value }

instance Attr anything OnLoadstart (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnLoadstart bothValues = unsafeAttribute $ Both (pure 
    { key: "loadstart", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "loadstart", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnLoadstart (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnLoadstart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "loadstart", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "loadstart", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnLoadstart  (Effect Unit)  where
  attr OnLoadstart value = unsafeAttribute $ This $ pure $
    { key: "loadstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLoadstart (Event.Event  (Effect Unit) ) where
  attr OnLoadstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "loadstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoadstart (ST.ST Global.Global  (Effect Unit) ) where
  attr OnLoadstart stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "loadstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoadstart (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnLoadstart bothValues = unsafeAttribute $ Both (pure 
    { key: "loadstart", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "loadstart", value: cb' (Cb (const value)) }
    )
instance Attr anything OnLoadstart (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnLoadstart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "loadstart", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "loadstart", value: cb' (Cb (const value)) }
    )
instance Attr anything OnLoadstart  (Effect Boolean)  where
  attr OnLoadstart value = unsafeAttribute $ This $ pure $
    { key: "loadstart", value: cb' (Cb (const value)) }
instance Attr anything OnLoadstart (Event.Event  (Effect Boolean) ) where
  attr OnLoadstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "loadstart", value: cb' (Cb (const value)) }

instance Attr anything OnLoadstart (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnLoadstart stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "loadstart", value: cb' (Cb (const value)) }

instance Attr everything OnLoadstart (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnLoadstart bothValues = unsafeAttribute $ Both (pure 
    { key: "loadstart", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "loadstart", value: unset' })
instance Attr everything OnLoadstart (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnLoadstart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "loadstart", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "loadstart", value: unset' })
instance Attr everything OnLoadstart  Unit  where
  attr OnLoadstart _ = unsafeAttribute $ This $ pure $
    { key: "loadstart", value: unset' }
instance Attr everything OnLoadstart (Event.Event  Unit ) where
  attr OnLoadstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "loadstart", value: unset' }

instance Attr everything OnLoadstart (ST.ST Global.Global  Unit ) where
  attr OnLoadstart stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "loadstart", value: unset' }
