import { config } from "dotenv";
import express from "express";
config();



const app = express();

app.use(express.json());

app.get("/api",(req,res)=>{
    res.send("backend running");
})


const PORT = process.env.PORT || 4000;

app.listen(PORT,()=>{
    console.log(`Server running at ${PORT}`);
    
})











